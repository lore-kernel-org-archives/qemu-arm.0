Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D4CCDB47F
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 17:01:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcQyc-0004dt-Nz; Wed, 24 Jun 2026 13:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wcQyb-0004dW-Hd
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 13:01:25 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wcQya-0005Nv-32
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 13:01:25 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65OFf9Fo3783618
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 17:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uSz4TSRz1icb+n+nN3yA3T+T2IqAyqlfM1CVVbD5+K8=; b=Nyn33P5UTj+o5flr
 rh0zL9TxkeuwEOEdzJFoWc13/RZWuINpCsq6p01UMgEoghFcXut6l8CqqMhQ7N7T
 TYS6Vyvrm5APj7TiCBpo9vnuF7LxiUenBygM7/ukG50SLm6bhM/JdrcWhpZfjNQf
 vL/H04o1m4Nc1bHPjAkeur5nPU5mGGJurx850dsLZly5BD84qXM/Y02B+VCc4OPF
 A3BkjYwrzX4RGbRnVdROHGNu3vcwyAnPdsGdaH/EQxTPKmhVBX72JOkv0Eg62Q8Z
 NW/06NMITQ14oAJj/N3PKLnurEo7JaaFTIHACJHo4owrcwnZ+eEEJpWTnGD75BLM
 +c9rOQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d5g1n9m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 17:01:19 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-137f3465368so2141841c88.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 10:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782320478; x=1782925278; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uSz4TSRz1icb+n+nN3yA3T+T2IqAyqlfM1CVVbD5+K8=;
 b=HQZTJCV/ZS4GXAlijS50leG4Jk6Z2FNLPLUhIU2mvJvnqCQJGiPc8Hab3slveUdJCG
 rKn/2jHHUZgLk4+tBeLz8K8KSdwtSCAvJ0YNZGwVBY+8K7Ho1xF42hkcALhc2qW4HiBM
 Oc+aeJHa9HpyEdtZHRRi4m0Sy14xbgygN93LPI6vnzUvaPuew+T5ccRQDlEKRHnYStFe
 SzpJqX2kggFogjTZb4Aj5ISfI1rAuI/dk6ki3NuIs8WBuZbZrXX+CIqelBowK9geDHC2
 gmEKguC63kMxuLf1cwW45Kkg6dUWDqvh4GU3eSyX+VBmXKknNGQj50FIY+AAXV95RjPA
 2s4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782320478; x=1782925278;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uSz4TSRz1icb+n+nN3yA3T+T2IqAyqlfM1CVVbD5+K8=;
 b=HDzvgEBqoHj/sA4+c7tPn3uMItU9NaWiH8feCSGyudHOUVKtdEjjKpYVA/8ByS905A
 mN906d1BQ6PpqE+XUwzy6A2jdXgCvRPTXEinggdaJex5KDJAAVSsl30voXzRgegRWuZo
 4LR+iVaTQqERvlqOsmApsdx9yNnJdHPdyYWd8iPb08FcO0gUejGhmG+/syhK5sR/ybMo
 HAtg2CYlzEAxGg+4zRWfslNTj3/g+pXCYIm9pZr1h9oWuTFixutz8OZ+bCgWCkf+d9C1
 oXLJpRgWH2Bc0M8BAMnOwJIUtPjJwkIVrgW39NDxx8oFQEO/cvEWb7Oe07zPTyw1mcX3
 S7sg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+QreT2/zxs6JyvH21k6qT+tStYHNzpRofog2yaTaUvt9bWymQhSWs81xmfFYzoZGQJBP3MHcDQpw==@nongnu.org
X-Gm-Message-State: AOJu0YzCZ7MbI8Ftw8T0kKR+PxDNpRaLwKhplFd6UCnGigfi2pbXYWl0
 Tw3wHRjmzKDPle3zAjGBgA+WyC23JerMsqgnBUTsrFEmHtZTsKwKPdEhwjdT/Wm1jtsufuSLYdJ
 JrD6nRHihdsGPuSP1MCbx92pz98SNQKr1Nf6zeT5HhXBfj9eN/62esC8=
X-Gm-Gg: AfdE7cn44S7lupjB83W3Kg/OyVzAgIRA5Qdm99kbDrprvbhE8X7AmziKut46QBUMdQy
 qUOanLtH7gLV5jwZ6LUnEeioZ5EnJZzKVXkUtIziAjkkq5705/qmV8zZDJxa4i7elueyCpy8G2f
 jKHWtZ2eKZoPfdVe/bzBXubSmylP/ihlVOMAYKDsMpR3/uY4yz39LNweLcjUpKH3yOZPCwDSjde
 pMqYcgzMjac6Fu3/uizsKSTwh1l6mqRHoK6TeaPFQI/ZfvvBkvmMIb3200ncMLv0pEA3LeJnGe3
 FTxAqJG5re/It/uLNoTgv8K/YDNcQcrDUc8WNmYUnoHUdz+8HXCGNcjA17GcN/d1sZLbpF6mwuZ
 970qt3StBxXzek5VKWcg8wXMLZ6IoJUr//ysFhN7INRnF+1PFmADdOsetpiyTDoZXVPwnwDOtep
 bCELY=
X-Received: by 2002:a05:7022:110:b0:137:e6a1:c4b3 with SMTP id
 a92af1059eb24-139d0b4491bmr2641220c88.0.1782320478152; 
 Wed, 24 Jun 2026 10:01:18 -0700 (PDT)
X-Received: by 2002:a05:7022:110:b0:137:e6a1:c4b3 with SMTP id
 a92af1059eb24-139d0b4491bmr2641184c88.0.1782320477515; 
 Wed, 24 Jun 2026 10:01:17 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-139d912197bsm678865c88.15.2026.06.24.10.01.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 10:01:14 -0700 (PDT)
Message-ID: <eac12939-fa27-4282-8913-1fbf463702a9@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 10:01:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/27] tests/tcg/meson.build: introduce exe_name
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Daniel_P=2EBerrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-6-pierrick.bouvier@oss.qualcomm.com>
 <87pl1gj7vh.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87pl1gj7vh.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdMMLDfi c=1 sm=1 tr=0 ts=6a3c0d5f cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=UXquZ8-bqUL8Tfdxd-IA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lYiq8NE9OE17L9oTQ39YwdeuxU8_ly7a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE0MiBTYWx0ZWRfX3vlGlf+F6bYf
 IiMaOFMEr3LUMQwfGGiAwtJk/X7L/EKf+GAsoSulef7aeIEM3E0CSzkeKmNV6g5AboTiaigjUZ4
 XRafHOLukQTp5aGp2zSBV0K3R8wQKmVZeXX/4DTs8/h5iUwIiZ6YAM65/uLMCzatiMbrXWRNwLY
 CDy5pYpaBHoaQJ1wC7G9odrehixGevMYmcpUFjvGkFR3Z5OKLNxxzrR0pbAOhV+GNJjlWqMqL1d
 TFehSIqtHX8aj4ZohnqgD2sSjQ/MwbreOn0H27ocmHkN8jBCI4GFCZaH66uWgstF26ZE7/BHbv6
 A2stvXITPo1xH727zvs8jTY4nkiCNMRf5TtDI5ClZI8QwgpWk3hcLUOr792/cWKqfHFfPZRVFCG
 ySmuHu/j5G6aDZXIXUjTgeVTBaklpg==
X-Proofpoint-GUID: lYiq8NE9OE17L9oTQ39YwdeuxU8_ly7a
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE0MiBTYWx0ZWRfXwp2k96EBn2o2
 NACf8SNPu1O15wIYjStQ4oInyZfSG6U98P0NclAgzFPvlX7kxUWI6QMF5sFY4RCYr8UFnomIAZl
 GMK1bhqrojW+7PtxYM0max6QLttEqXU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240142
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 6/24/2026 8:06 AM, Alex Bennée wrote:
> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
> 
>> We add possibility to duplicate a test executable for a given source
>> file. This is needed when different cflags need to be used (like
>> vectorized vs non-vectorized for instance, like sve tests in aarch64).
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>> ---
>>  tests/tcg/meson.build | 17 +++++++++++++++--
>>  1 file changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
>> index 72d1a9f8986..2c6d85c586a 100644
>> --- a/tests/tcg/meson.build
>> +++ b/tests/tcg/meson.build
>> @@ -11,6 +11,7 @@ tcg_tests = {}
>>  #     'tests': [
>>  #       {
>>  #         'src_file': {
>> +#           'exe_name': ['provide an alternative binary name'],
>>  #         }
>>  #       },
>>  #       ...
>> @@ -18,10 +19,10 @@ tcg_tests = {}
>>  #   }
>>  # }
>>  #
>> -# Every test executable, is built only once.
>> +# Every test executable, identified by 'exe_name' is built only once.
>>  # Tests for a given src use the same executable by default, and their definition
>>  # is guaranteed to be unique also.
>> -# Default name is derived from src.
>> +# Default name is derived from src if 'exe_name' is omitted.
>>  
>>  # plugins come first, as we need to build the list
>>  subdir('plugins')
>> @@ -47,11 +48,23 @@ foreach target, plan: tcg_tests
>>  
>>    foreach t : tests
>>      foreach src, setup: t
>> +      # return a clear error if user mispell a setup entry
>> +      foreach key, _ : setup
>> +        if key not in [
>> +                       'exe_name',
>> +                       ]
>> +          error('unknown tcg setup entry \'' + key + '\' for test ' + src)
>> +        endif
>> +      endforeach
>> +
>>        # meson '/' operator drops left operand if right is an absolute path
>>        src = folder / src
>>        file = files(src)
>>        test = fs.name(file)
>>        exe_name = fs.stem(src)
>> +      if 'exe_name' in setup
>> +        exe_name = setup['exe_name']
>> +      endif
>>
> 
> Would it be better to put exe_name = fs.stem(src) in an else leg?
>

The rest of the file follow the pattern
var = default
if (different)
  var = other

So better to stick with one pattern for consistency.
It absolutely does not matter for "performance".

> Anyway:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 
> 
>>        exe_name = target + '-' + exe_name
>>        test_name = exe_name
> 


