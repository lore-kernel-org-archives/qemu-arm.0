Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A04C5CFC1
	for <qemu-arm@archiver.kernel.org>; Sat, 15 Aug 2026 12:25:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvDSA-0007Py-K4; Sat, 15 Aug 2026 08:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvDS8-0007PO-7h
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 08:25:32 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvDS6-0001iS-GE
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 08:25:32 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67FAbcDT833122
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 12:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XmU6eE9/+bgbPRJ1xj/UbX/LtaE4qCE7yGo3XZ+RkdA=; b=SdRjDOv1ibAwDFwO
 6XdWvLkVEZemW8wnKeeXJ/x4slewKDwHoAnpuSwXXrp0tD8Ic/0YbdhM+nrnGSH0
 XEkWqjesOyhjLLi7XwG5yhgF6xAAq91qP3aeHCeRtarr/esrbqbt4wCgzSGYCctC
 NgxToMaFp5CkXwFF49exRrZ840iYHnVHL8ibuUl8DbXgg3+O406Wsbwmff5YcaXQ
 ZBYbyhTRgKIpgcyhUEzBD9C6rH44afbd2g7vWDtAybF69UsC5EkcUolpHzQKLtFm
 9gU2odclkmAno+4ET9eNnFORb1+MFx5IgsfQyRadbHqGssQQfV2i8gHo1liiIsdN
 aZm4+Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghwgw3c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 12:25:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c0e702df8so24405061cf.2
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 05:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786796727; x=1787401527; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XmU6eE9/+bgbPRJ1xj/UbX/LtaE4qCE7yGo3XZ+RkdA=;
 b=QwsCxl3XUw4qw1nSOADQ7Za7lm3fawcVKM1zu0QenW8HyPMZwUP8mLzmabBlVDmKhY
 76DxxsxUTkI3CQ2PK5hjEXEgvNymzK3qdjqq1Et6x6n7KEFQAfhbHYkM8SIU9MTiVefO
 AHkHTHNAacMYpyuiXFZDdt9Xe5UKtJ5va0n4WktXDorMssxlPasAtzpeAFzjF57KMfgG
 GbQo0Rx/TMtFZDXK0jqttq1EHwO1hWQiOOCBcHx6gLz/FBQN8HwQSJoTUIlQCrnYh0Tt
 0kvp+PYGQO8z9klbQQqhyHS2Vp+uNoefW1jHizxNzdP+lZTYY6s6O9PeRuCLSo/4c0D1
 zIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786796727; x=1787401527;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XmU6eE9/+bgbPRJ1xj/UbX/LtaE4qCE7yGo3XZ+RkdA=;
 b=UZnHkS21O5xbwfzl8CKFhaCbrZ9f4sR2FTFYb5xhbzlelSuzdFF7ozjwu0OwvCIeaC
 /34NvwSDtKnHuIOzYaFUJ6hYfBgKf89uWTDO7frEdNOP6L1Mnk8iWkWiyjwhy9YM3IUk
 skPO87blJV1fZNbLnsuvZXUVxpUJ62hSMkcwShtpyGilKIuWiZvY2paLXso/kZPUGL3i
 NUQKKGnozoSAB1E+A5zT88qz9uuYWZ1DV7F2bchRMiVrb1LnmD7WV0htq4cGo4PO2OoG
 GwUCfjYL8e3+FuaZfeHwWD8n+O9h1x5g+i2yMg96yhsZWBOwS4Sdl5PKkzY15baClWvL
 3yww==
X-Forwarded-Encrypted: i=1;
 AHgh+RrsTzgH0Uu7gYBiLGcor1Wv5GVEmE8oA8/rcoNI/Q4QPVPNsrx8vBqd0yCa7ZCGJ94UjcxDPlNWRw==@nongnu.org
X-Gm-Message-State: AOJu0YxFfGEDZxG+MKTLPOGaN2w9/c3fx4YJQpX0P9tSbXdvxP4nv1K5
 7FJwgHrj4DeXR2X7mXGhiYoUvWvbdGhdxiT1/xVaNX+GGjCsL1XwHJN7gvGUKjpMRPLCXe2K9Fs
 K6TzJU/cqpiBEvB9Q5r+AIBc0/sfVzrzxSJ663M0R7M+QWyG+4hOA21I=
X-Gm-Gg: AR+sD10qc/bfmWsF7TSTTlhOdqkCb5Q9FRQG5R0HpNdSkiMBzaAbP08eqrasj0lXCTk
 j0ByQpXip7hhCavHjsXNhPQfhqi8cSMQDqG8g1o77ZjG7mOz+jfq7Ig5TPCaVNajY6MatbymXsT
 fnmMwcHWZpsC6oY7tNOcBYpwH1jzm0MC6RRB9UxeuFcdHVVc8BI1HfSHg+Oy9vO+cOtVo4uNdSr
 EVf+7X5BgtgflNEWCaX2itD51nSmxoSN8mxKS7WyRIABwCgSHVDDwmGskWFhsFaMGNpBk6CVtEh
 TMmCkxSF8vo+mi8h/ArSTsLXweLYI5CQY1aJ7syMNmoNi5dloATm4ks+LW7OzpZ2IU1c/kIs8Pb
 OnjNOtMzwB4Mfbx3mGkPtfLsDl9Vm6DY/ROM=
X-Received: by 2002:a05:622a:1194:b0:528:15e:d1d4 with SMTP id
 d75a77b69052e-52d852f2c48mr134999601cf.4.1786796726709; 
 Sat, 15 Aug 2026 05:25:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1194:b0:528:15e:d1d4 with SMTP id
 d75a77b69052e-52d852f2c48mr134999101cf.4.1786796726270; 
 Sat, 15 Aug 2026 05:25:26 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2cc811sm16757415f8f.33.2026.08.15.05.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Aug 2026 05:25:25 -0700 (PDT)
Message-ID: <152e3758-3ab9-4264-b7bf-4e5ecea01a81@oss.qualcomm.com>
Date: Sat, 15 Aug 2026 14:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] hw/qdev: Remove DEFINE_PROP_DMAADDR() and
 'hw/qdev-dma.h'
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-14-philmd@linaro.org> <87zg1a8r5v.fsf@pond.sub.org>
 <87bkdq8qh1.fsf@pond.sub.org>
 <0e258375-e3a0-8b5d-189e-cb2cea913ecb@redhat.com>
 <878r8tjul9.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <878r8tjul9.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 773nckb60LjK4miti6R4xR1_Bp46opC4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDA4OCBTYWx0ZWRfX6KtOMR1s/by/
 J4FQtYsy7QXX7pBmFFyoA2UIhmBS5XpRM0aBRnFE/Yp/g4iN6VC791rUBolQ//DfN7X0J4igDiR
 U+WiiFeC5QZ6wenMBG0lBP3jD2aFWfSyHMKWPgtlwa6F1Iebdq5jWj3gyZb1vgDl2DdZl5AeitC
 8hticoIcqvD0U9TIXwWuIWCRO6/Z2FbCOydmNTMuL87V2aaHF/EWX+I3ajR7yyRcCpNxmH+uijo
 6hcBtKWS+aUOK1UChwmu+LJYimzL30EB2Z5sOzDQyTiNJGg6zJqW6e8qtNQO5N1Eraq32YoquNY
 vD3YzZiTRl/vYd765s7ouC7SCm2DTW1Qme5knLtYqsoc+5rJLee/2dV2rIWbzv246RKYB/zih6W
 1vhrVKzVuD9UV2nUd+7GXk7vHySbInhzcRf+q29tCXJdKNilgZsN4sy4VmViicyvySZej1lhylg
 6szN7uTydGoKOiXDpPw==
X-Proofpoint-GUID: 773nckb60LjK4miti6R4xR1_Bp46opC4
X-Authority-Analysis: v=2.4 cv=DdknbPtW c=1 sm=1 tr=0 ts=6a805ab7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=9eiHNfBOPmZBpzHCVuIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDA4OCBTYWx0ZWRfX5uKhwREVhFTp
 6HIDhClsSICCUwlW73A+Bi+e+oqPcRqw+Zc4t3nnia8TtRUkX1fiOxDhIyXiBVBB/n97sq6kDw+
 6eDCpe+Xps9/ofCLQGVn2AI9i5wVwfw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608150088
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 26/9/23 08:51, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 9/25/23 13:03, Markus Armbruster wrote:
>>> +David
>>> Markus Armbruster <armbru@redhat.com> writes:
>>>
>>>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>>>
>>>>> DEFINE_PROP_DMAADDR() is only used once. Since it doesn't
>>>>> add much value, simply remove it, along with the header
>>>>> defining it.
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>
>>>> DEFINE_PROP_DMAADDR() lets you wrap a property around a dma_addr_t
>>>> member without assuming anything about dma_addr_t.
>>>>
>>>> Whether that's worth avoiding I can't say.  Depends on how much the
>>>> abstraction leaks in other ways.  Thoughts?
>>
>> I think it's okay to simplify things.  If anybody ever has a reason to make dma_addr_t variable sized (probably a bad idea because many of its users are compiled once only) they have one extra place to fix.  Tough luck. :)
> 
> Makes sense.
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Thanks, I'm queuing this single patch via my hw-misc tree.

