Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4730FC44500
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 12:31:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh4x0-0002Cq-9n; Tue, 07 Jul 2026 08:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh4wy-0002CH-CT
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 08:30:56 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh4ww-0007pe-GQ
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 08:30:56 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 667C8xF83719161
 for <qemu-arm@nongnu.org>; Tue, 7 Jul 2026 12:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ab858FTsqpKQS3LHMrR2Qe0R0TjRW7W5vkNl7SRbaiU=; b=OmU1ovFv+WEF9tn/
 zopIaJoQjpwBWjvBHvrdjtRGfA46VTFBbfbPeKHa+IYu0T5Dh4uz5Fw2xJxM/6Lb
 7vbM0FF6we4NvJilZCLgpeN4eG+AbLgDxjbhl/mhV+JAvwnzCgSR6N/+r2LZuWFn
 7Rg5b+AOjYTMso5ewqG7bqtjVe9sSm7ndbt1JMueKF/HcHlMZiOHCZoNgeN7g7Ab
 bjvKxqgB0aOaHwh0vq72dq8V7wG8LQvgJXKq98A93WKCvyM+RmXupMJIFnvwGI6R
 T6hi0rNwuTxttE/uLIibPup2yzJy0PDRFtIC/Chea/Pdc77d1DJrgEK1ICdQ6lye
 Gyj9Iw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v3t9eyp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 12:30:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8ef8249f73fso94265256d6.0
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 05:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783427452; x=1784032252; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ab858FTsqpKQS3LHMrR2Qe0R0TjRW7W5vkNl7SRbaiU=;
 b=P+kLUP8NAnidVDxh5hCVJqA/bk0o4Gks2yPWLkrPrw42kcaIMlmP1GOWlrlmT6Bo57
 ed51bt09p2NQ72YHn5m4wE+ViJq5yA90nklo2vKoIIJeuufI7CZq0BwytwuvhVIPkFZX
 x2ZSUUDNWAkwSsf0mez+LvtrHpVtGOq9Xbd9RFeg04jdnUaG3HCDAotq4uj3YBvKD4yI
 HpBXcpzZwfKr1nx+ApJNYaBIUykcg9xXCDlYo7KOcNuE4O7fWBJ26A0vr+fTPFQdgOFX
 2mbk+xz9kRDo06NCFwJ3aOrGokb+eru/ukEs6t58X2A3/kOi3pe0qjWCdn/AxuoP4/YB
 z0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783427452; x=1784032252;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ab858FTsqpKQS3LHMrR2Qe0R0TjRW7W5vkNl7SRbaiU=;
 b=AfQPHD5pKWUAjcV0DkyM3RXvqCrgF6DlgJ48Hr5fn2DeZgUJnkT/cheh6ut4f6Ca7c
 TFHfB+RvGimPP404ECY2cSS0q00jI4dVyr7XvI3cgRHVG+p+DqQuLGeNM/hSyspEHL3B
 Iv3ZQg+0b+u/CdfbZX6/gYONTnxh1nECdnB4vJ4Skl3ovt29ucmGcy41/BwzMhccuy7S
 aOYirlAehu87Ht94UCct2XjklTYmZB2GO4TLl/x6v6eCVgyPipbtkVIuumVKPDULrCzl
 9QnsEW3zxQL5Vuy/cJLqlaLntBRGfXqZanAJFRrNnC8PVNOPG+gnWzui2hEBbso/2IaY
 aB9Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro1XFtWdRb/9MZaBwTlfuesiknfkYP3m61NYWD0Rbf88zVzJx4GBsawbLeIN1sAjSYBgJ75VFNipg==@nongnu.org
X-Gm-Message-State: AOJu0Yz/AjozIRZG6Opn+DOROlqC1x3CcVUJoZfTIr3FR5023JJjnK4S
 /mOfvtQXPHdq0XIxor4QzSz9ugSR0PZEivi+ZyYUI2hs8Qp0xx2KrTLb5uzHY25jry8xCGkZMHk
 mMEIsh1KD5t1qkY8Oo/G373RnoHqmGVC7uaiByYpEp+uWH9bO57whs+U=
X-Gm-Gg: AfdE7cn7w/Etbm78VOgQGKsNje8+K9WAzUd7bxYNhIQWs1Zj7KC/lPk0nEUxKjBhR4a
 OW++F5hWDSTRJej9vAEKHoyKeEYqvH0iYl2Fqzmj1EDChpWb7zU3RZNmECOeOOkCjLrYPpgeb9A
 4Ym/vwqYtwxp3IwoiEB29x/luwb2WQwxAsVDgGKgbKagAVImP/DBBQNnAyJFi8w7m1F0kVnm4fp
 tt1L9J6nUBqhgD+Qo+pXvB6aX28cNAtrWLHR1QMA4f1Fn5EZrU1sGBW2wtXZtJt+5gYCvpSPLEi
 RT2cXnA1NJCBG82wOg97bTGOCGqtQnojs9UB6TUZS9qH3nqTNSXrywJ1sY7ffU/DQ/Sy5AwAlsB
 /STpvr+DIeAu6xLx2G3/9tKSid1yr95AocgFcVogVYHfjpfXJ4UuGhljIMULUUw==
X-Received: by 2002:ac8:5f83:0:b0:51c:196:98d6 with SMTP id
 d75a77b69052e-51c748d4a39mr53078341cf.67.1783427451516; 
 Tue, 07 Jul 2026 05:30:51 -0700 (PDT)
X-Received: by 2002:ac8:5f83:0:b0:51c:196:98d6 with SMTP id
 d75a77b69052e-51c748d4a39mr53074891cf.67.1783427447327; 
 Tue, 07 Jul 2026 05:30:47 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-69a19d9e701sm5993135a12.21.2026.07.07.05.30.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 05:30:45 -0700 (PDT)
Message-ID: <f0b42f48-2d4b-4f9d-8a3d-3abc1da411f0@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 14:30:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] hw/arm/fsl-imx8mp: Add inital FlexCAN support
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Matyas Bobek <matyas.bobek@gmail.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Jason Wang <jasowang@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Francisco Iglesias <francisco.iglesias@amd.com>
References: <20260702184038.178196-1-shentey@gmail.com>
 <519f6e43-5273-4426-b673-71cff44daffa@oss.qualcomm.com>
 <CAFEAcA8aR6GPZWDphbTgPhVf3G=eoNrAFdb9QcLCGh9hdavkAA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAFEAcA8aR6GPZWDphbTgPhVf3G=eoNrAFdb9QcLCGh9hdavkAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VX5lpfdF1d7jrSuQrufuKwJ6cGGgc0jS
X-Proofpoint-ORIG-GUID: VX5lpfdF1d7jrSuQrufuKwJ6cGGgc0jS
X-Authority-Analysis: v=2.4 cv=HqVG3UTS c=1 sm=1 tr=0 ts=6a4cf17c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T0SivsIveDCceivP5SkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyMCBTYWx0ZWRfX39TTkUPbS8nF
 8H0Jj8Yjq0egLhGzCNOzY5O3TUsLh87kZk5ySoWDw17muKcwKCidzOXD9uvAWYm/ECm4/N3jYZl
 2nWcwDoGJ+JCV8BtRFXOIqm8gRrPvGcHNIe8NSv38ltxknoPS8QO8vB4tuMJwYgTUERK3FeJhjq
 vnWN6o+FdeGDPxUs2ycc8gNcAnLuuMG2uo5JeX+VTQHfAaPmDlcMRUEIdPrQbJRGSh8sm6IPeYo
 yK9HouMWGvXusSC5ijYaJ1R1JppYbj4WmrRU9y7HJbHAUYAcv5LHQG9lCsXOkTBoZsw40T3QfPY
 q4xA6KXRv6DAS2pZ4HdsB9meGjOwMq0iRuENx/LMIbXzC0CTsNF+QoFOqUQcQ0f96eAV+AaIEwu
 gXM7LAHjeySasfaPYwIhGXQgGdFnNbTgnOSP0JEqyG2AwWJlgNF1ASSFBXrNe8g/ruxwhv+K2Ys
 9t29mmw/l0qo1A19fxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyMCBTYWx0ZWRfXz6PP1DJcZWCX
 aw1PT5fCOjuyObL29AT+8WNmzEthUbrbJOYQ2C12c5oSzq1kz1OU2rnKsdN71PuaEAwzR6ULdfD
 wZ/KcrR1F4uiKZcToDHxSaot8WEccrA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070120
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 7/7/26 12:43, Peter Maydell wrote:
> On Mon, 6 Jul 2026 at 14:25, Philippe Mathieu-Daudé
> <philmd@oss.qualcomm.com> wrote:
>>
>> On 2/7/26 20:40, Bernhard Beschow wrote:
>>> Now that FlexCAN emulation has landed in master, let's add it to imx8mp-evk as
>>> well. While the real i.MX8M Plus supports CAN FD which isn't emulated yet, the
>>> non-FD mode works well under Linux: It is possible to use `cangen` and `candump`
>>> either way on the host and on the guest, as described in
>>> docs/system/devices/can.rst.
>>>
>>> This series consists of five patches where the first four are preparations.
>>> The last patch integrates FlexCAN into the i.MX8M Plus SoC and EVK board. The
>>> first preparation addresses the review comment from [1], and could be applied
>>> independently.
>>>
>>> It would be nice if this series could make it into 11.1.
>>>
>>> Testing done:
>>> * Start imx8mp-evk and run `cangen can0` there. Observe on the host that
>>> `candump vcan0` prints the traffic.
>>> * `make check`
>>>
>>> v2:
>>> Thanks for the very helpful and super quick review, Phil! Here we go:
>>> * Add patch "hw/net/can/flexcan: Wire clock control module via link property"
>>> * Have separate MemoryRegionOps for 32 and 64 bit
>>>
>>> [1] https://lore.kernel.org/qemu-devel/77d5891c-de12-467e-8746-02fe43121e3e@oss.qualcomm.com/
>>> ---
>>> base-commit: a59157f98f0b69b0bbdb26bc15fbc4d6c8060799
>>>
>>> Bernhard Beschow (5):
>>>     hw/net/can/flexcan: Wire clock control module via link property
>>>     hw/net/can/flexcan: Subclass TYPE_CAN_FLEXCAN
>>>     hw/arm/imx8mp-evk: Open code DEFINE_MACHINE_AARCH64
>>>     hw/arm/imx8mp-evk: Introduce FslImx8mpEvkState
>>>     hw/arm: Add basic FlexCAN3 support to TYPE_FSL_IMX8MP and imx8mp-evk
>>
>> Peter, you just sent your (IIUC) last target-arm PR. I'm about
>> to post my hw-misc one, do you mind if you take this series which
>> is fully reviewed/tested?
> 
> As you note, I've already sent the last target-arm PR for pre-freeze
> yesterday; I'm not going to do another one. So from my POV this
> has just missed the deadline and will have to wait for 11.2.

Err, I meant "do you mind if [I] take" ... :/

