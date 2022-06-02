Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp4842772lfh;
        Thu, 2 Jun 2022 04:46:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxInwlwnujoDncCyjGCoJIW75X7xZ0prux6D1Eo8p4/x/DOlGlNPTY95tQ5LlHvkwHkjRyk
X-Received: by 2002:a05:622a:1110:b0:304:c366:a80f with SMTP id e16-20020a05622a111000b00304c366a80fmr3156471qty.640.1654170362811;
        Thu, 02 Jun 2022 04:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654170362; cv=none;
        d=google.com; s=arc-20160816;
        b=HsovGwl6dUbw4HjTFrLkPkzrW7wy2d4+XoOr6NJcLBxY5RE/Zm50a6mO0PZvmyx9gl
         +Mjm92DHQHGUGIaIF2lHomYWW5N0a9Fkm0WhI9i1urZIMXhjtyU6kC3M42TOd5VNJxZE
         ljgAMeYQXHdkIn8TctTVHli8eq5rXVnptof95k63GB1BvN/Tl469BwyIaKSdM1ld+mjS
         CHfg+bntdq9v2RjLBPZOxgoe+qqgejq5apzHM4YJw8Yi+eS7rVRNEEJ2O3IYE0hfUcSI
         EVz+o4YV8Y8uighU+Fz4/7PcAiBaFeVjQQtgKGH6sQ26o/HQDjAIgGRzu0IoZZXUTUHB
         8D0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:cms-type
         :content-transfer-encoding:in-reply-to:cc:content-language:to
         :subject:from:user-agent:mime-version:date:message-id:dkim-signature
         :dkim-filter;
        bh=6vtwdhq1ZiM7VUPI4ZCn4FhMLb7tt1IDeTvWsoxxXhs=;
        b=O+rCfT+5T03ByteXPPmJeQ4bGtt3t2aa1WRg8GBOxyR7fj4frSW0NSIkMnMJG9Anlt
         yFgyYYiE54FIZMVsv1oy41YMj4AO3EZHBOPK/loE7d109AI8B90deEN1KhG8UT9DXXYf
         3Wa4WphyXXYSwT+bhcjosm6874Iw9urEmkY8oyezDUrMFrmKALy7T3uRZNmXwkJaGHWK
         iT53aWPw5xSBJy1SZr3j0IK4XaF3oe0abdwE50YkfDE62fvk2+SEE5+WmJ+P9v0cLDP4
         fQwd6FhSmJ2Sfq5sWkbWvuf0awnvUi/khcGe0id0Zaknd8s14Dl3stMK0xJr9JWlaK1F
         fGOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@samsung.com header.s=mail20170921 header.b=SonXl9ra;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=samsung.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x25-20020ae9e919000000b006a37682052csi1891588qkf.410.2022.06.02.04.46.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 04:46:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@samsung.com header.s=mail20170921 header.b=SonXl9ra;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=samsung.com
Received: from localhost ([::1]:48012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwjH8-0001hc-AF
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 07:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.kotrasinsk@samsung.com>)
 id 1nwjGB-0001fV-En
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 07:45:10 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:11369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.kotrasinsk@samsung.com>)
 id 1nwjG3-00076o-9M
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 07:44:57 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220602114444euoutp02e8b5e90ab378d5b6587d0c90aef37bce~0yxvxKrNP0382703827euoutp02g
 for <qemu-arm@nongnu.org>; Thu,  2 Jun 2022 11:44:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220602114444euoutp02e8b5e90ab378d5b6587d0c90aef37bce~0yxvxKrNP0382703827euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1654170284;
 bh=6vtwdhq1ZiM7VUPI4ZCn4FhMLb7tt1IDeTvWsoxxXhs=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
 b=SonXl9raGW6TVmRwudrjblFkvjGLI0ec4GyOiGTjYWxs0YVDjh5t/X3cK71HVaZRS
 Ct9iq8XRbzebg7NfE+F93S1NB02HqlRD2vRuvFeTSKLASRlO9Fia+qVmEjd9egfF6q
 55PFVsLPgShW941XuLBSHC1fNbOVTYETbL/vxHDY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220602114443eucas1p13e4e25ffed9dc5ba1399e1619b73b54a~0yxvpBGY71237612376eucas1p1W;
 Thu,  2 Jun 2022 11:44:43 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id EF.FE.09664.BA2A8926; Thu,  2
 Jun 2022 12:44:43 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220602114443eucas1p2aa915ec355b45fcc00ec2679d28b2d57~0yxvXXZ4d2310223102eucas1p2-;
 Thu,  2 Jun 2022 11:44:43 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220602114443eusmtrp133d555a529d34fa40a494cb3875f7ad8~0yxvWyhrA2465424654eusmtrp1s;
 Thu,  2 Jun 2022 11:44:43 +0000 (GMT)
X-AuditID: cbfec7f2-d97ff700000025c0-dc-6298a2ab6e7d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 6E.9B.09095.BA2A8926; Thu,  2
 Jun 2022 12:44:43 +0100 (BST)
Received: from [106.210.134.115] (unknown [106.210.134.115]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220602114443eusmtip13a350f0b04a4cf2e71613319281b147f~0yxvGjy5N1844018440eusmtip12;
 Thu,  2 Jun 2022 11:44:43 +0000 (GMT)
Message-ID: <790734d6-1234-844f-0afa-a3e3b4020dac@samsung.com>
Date: Thu, 2 Jun 2022 13:44:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
From: =?UTF-8?Q?Igor_Kotrasi=c5=84ski?= <i.kotrasinsk@samsung.com>
Subject: Re: Help: NVIC, level-triggered interrupts and interrupt pending
To: Peter Maydell <peter.maydell@linaro.org>
Content-Language: en-GB
Cc: qemu-arm@nongnu.org
In-Reply-To: <b3d8f8b5-3976-8bb6-41b1-8b557524665a@samsung.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMIsWRmVeSWpSXmKPExsWy7djPc7qrF81IMti1ztBizpkHLBYLuhey
 OTB53Lm2h83jybXNTAFMUVw2Kak5mWWpRfp2CVwZkz59Yiu4Llfx5PIl9gbGzeJdjJwcEgIm
 EivePmDuYuTiEBJYwSjx4MANVgjnC6PEhrXr2SGcz4wSbZMmscC0fP87hRHEFhJYzijxaqUr
 RNFHRomm6d1gCV4BO4l1i9eyg9gsAioS3yYuZYWIC0qcnPkEbJCoQLLEubNX2boYOTjYBJwk
 Jq2SAgkLC3hKLH18HWyMiICOxJXrm5lAbGYBcYmmLytZYeyJU0+CjeEUsJe4cPYjM0RcXqJ5
 62ywdyQEFnJIHNm0ix1kvoSAi8S7GQ4Q9wtLvDq+hR3ClpE4PbkH6q9iiSVnd0DZNRLnu1dC
 1VhL7DrezQIyhllAU2L9Ln2IsKPEvetHWSCm80nceCsIcQGfxKRt05khwrwSHW1CENVqEtN+
 7WGGWbqs8RHLBEalWUhBMgvJj7OQ/DILYe8CRpZVjOKppcW56anFhnmp5XrFibnFpXnpesn5
 uZsYgeni9L/jn3Ywzn31Ue8QIxMH4yFGCQ5mJRHekl1Tk4R4UxIrq1KL8uOLSnNSiw8xSnOw
 KInzJmduSBQSSE8sSc1OTS1ILYLJMnFwSjUw1XK0XDddf27hNw/Tb8pzp7f6/q262Hu4ZdLL
 6wtyDy2p0GjkfcvB6ujpvTFo3xyzY4sivPZaJWT9E7mzIuTI0ubDvnNfXijyd79075bripk7
 Q16+4UnWtFi8uGlDuXGlVfgkjwb+/2yu5RsY3er3sK23Lcz0VfKpb+O73C+9fq1u4/Ic1a9a
 Cervcj7u+m7zxfz1zPVHHn4oF19yNnOiYNLcjbyJDxM+3mEqy+0048vk2+Lwe6p5EbO+nX7X
 UUXezhe7OV4e2cPXu8/m3rqM6Y9Yj9jkcy29se/YeR359mqV0O8J+Z2X92aK5E/YeMLmbKXl
 Nvc04Ukdsc3XFCNWR69Ncynh3lZjttvv1e9iJZbijERDLeai4kQAlVwPWoYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnkeLIzCtJLcpLzFFi42I5/e/4Xd3Vi2YkGTS1ylvMOfOAxWJB90I2
 ByaPO9f2sHk8ubaZKYApSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384m
 JTUnsyy1SN8uQS9j0qdPbAXX5SqeXL7E3sC4WbyLkZNDQsBE4vvfKYxdjFwcQgJLGSV2zLnJ
 DJGQkfhxeg0bhC0s8edaFxtE0XtGiU87roAV8QrYSaxbvJYdxGYRUJH4NnEpK0RcUOLkzCcs
 ILaoQLJE85ZDTF2MHBxsAk4Sk1ZJgYSFBTwllj6+zghiiwjoSFy5vpkJYn4Xs8Sp/qdgM5kF
 xCWavqxkhbEnTj0JNpNTwF7iwtmPzCAzmQXUJdbPE4IokZdo3jqbeQKj0CwkV8xCMmkWQscs
 JB0LGFlWMYqklhbnpucWG+oVJ+YWl+al6yXn525iBMbItmM/N+9gnPfqo94hRiYOxkOMEhzM
 SiK8JbumJgnxpiRWVqUW5ccXleakFh9iNAWGxERmKdHkfGCU5pXEG5oZmBqamFkamFqaGSuJ
 83oWdCQKCaQnlqRmp6YWpBbB9DFxcEo1MJUyF0Z8CIzddrjp4iPmjbvjk7ucfqntYf5nfFVK
 3e+TQfNfvRmn5XUjQuzFPJesb7TMP2BteGzxVf7jprWfAyrZfIzWS7fEn+LUbhd8Vm6wNd8h
 oU4gfebEd9bxP+8xG5tMW2DlIrDo5EJdsfaFpz7kRJbFZN24PCPx4IMY5qacBt8Y/7DHDnoP
 TNTeLXK96u4a/j7chbv6mev30L/THs4t+P3dQsBT4BLbisrjQiXyyXz9m6aaHotrsXK8o/Ik
 5fmUJiZlw0eHb225HyTKmidQdrDrz4G/EisWhTM5tsTM23Xrcuj8y29D1kk7nOJz196wQqDA
 84Hg8tp5OX8mf9nj/aPnwz2TOSLrQp76K7EUZyQaajEXFScCAOFbTMwaAwAA
X-CMS-MailID: 20220602114443eucas1p2aa915ec355b45fcc00ec2679d28b2d57
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220530093333eucas1p2c05b46a5f9c66704919743236753858f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220530093333eucas1p2c05b46a5f9c66704919743236753858f
References: <CGME20220530093333eucas1p2c05b46a5f9c66704919743236753858f@eucas1p2.samsung.com>
 <e3573c25-1ba6-cb57-f813-99c538a2d254@samsung.com>
 <CAFEAcA8EqCh0LDS=N+5W8fPnF2Fj-Z7r=wssDAD-V5tBWRM85w@mail.gmail.com>
 <5a05e699-d050-adae-ca14-c68b5534f214@samsung.com>
 <CAFEAcA90R49A6txYhP_vFHoa=XPV+g6XxoZdVXmHcS2EPW__Ew@mail.gmail.com>
 <b3d8f8b5-3976-8bb6-41b1-8b557524665a@samsung.com>
Received-SPF: pass client-ip=210.118.77.12;
 envelope-from=i.kotrasinsk@samsung.com; helo=mailout2.w1.samsung.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AVhGJH2pjr2p



On 30.05.2022 14:02, Igor Kotrasiński wrote:
> 
> 
> On 30.05.2022 13:54, Peter Maydell wrote:
>> On Mon, 30 May 2022 at 12:34, Igor Kotrasiński
>> <i.kotrasinsk@samsung.com> wrote:
>>>
>>> On 30.05.2022 12:49, Peter Maydell wrote:
>>>> On Mon, 30 May 2022 at 10:33, Igor Kotrasiński
>>>> <i.kotrasinsk@samsung.com> wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> I've been hacking on QEMU recently, adding support for a custom
>>>>> Cortex-M
>>>>> board. One of the devices that I'm emulating is using level-triggered
>>>>> interrupts, for which I assume qemu_irq_raise/lower is the right tool.
>>>>> However, I'm having trouble receiving interrupts for my device which I
>>>>> *think* are caused by interaction with setting/clearing
>>>>> interrupt-pending status.
>>>>>
>>>>> The way I'm handling my interrupt currently is as follows:
>>>>>
>>>>> 1. The device raises an interrupt with qemu_irq_raise.
>>>>> 2. In interrupt handler, I set the clear-enable nvic register and
>>>>> queue
>>>>> a handler.
>>>>> 3. In handler, I read data from the device and set a register that
>>>>> lowers its interrupt with qemu_irq_lower.
>>>>> 4. Then I set the clear-pending nvic register.
>>>>> 5. Finally I set the set-enable nvic register.
>>>>
>>>> You don't say in this sequence where "return from the interrupt
>>>> exception handler" happens, which is an important part of the
>>>> sequence. (That is, I'm not sure whether your design has only
>>>> step 2 in the CPU exception handler with the "queued" handler
>>>> being run after exception-return, or whether all of 2-5 are
>>>> in the CPU exception handler for the interrupt.)
>>>>
>>>
>>> Sorry, I lied a bit here. I'm running someone else's code and I misread
>>> it a bit. The exact sequence here is:
>>>
>>> 1. The device raises the interrupt.
>>> 2. Interrupt handler sets the set-pending register, then the
>>> clear-enable register, then returns.
>>> 3. A handler running outside exception context reads data from the
>>> device and lowers the irq.
>>> 3.5. The device raises the irq again.
>>> 4. The handler sets the clear-pending register, then the set-enable
>>> register.
>>
>> Does this code work on real hardware?
>>
>> Do you have a test case image you could provide?
>>
>> thanks
>> -- PMM
>>
> 
> The code works on our board which uses a Cortex-M35P, unfortunately I
> don't have a test case image I can share. I'll try to prepare a minimal
> example that runs on mps2-an505 or such.
> 
> Igor

Hi,

I don't have a test image yet, but I'm pretty confident I understand the
bug now.

As you said, an interrupt becomes pending if the input IRQ line is high
and the interrupt is not Active. The first condition in R_CVJS doesn't
mention any transitions, so the "event" mentioned there happens at any
time the condition is valid. So, no matter what writing to pending-clear
register does, pending status should still be set afterwards. This would
also match the explanatory document I found.

This diff would be a matching fix:

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 773e311754..bfd0fafe0a 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2393,6 +2393,14 @@ static MemTxResult nvic_sysreg_write(void
*opaque, hwaddr addr,
         for (i = 0, end = size * 8; i < end && startvec + i <
s->num_irq; i++) {
             if (value & (1 << i) &&
                 (attrs.secure || s->itns[startvec + i])) {
+                /* Stay pending if line is up and interrupt is not active
+                 * (R_CVJS)
+                 */
+                if (!setval &&
+                    !s->vectors[i + NVIC_FIRST_IRQ].active &&
+                    s->vectors[i + NVIC_FIRST_IRQ].level) {
+                    continue;
+                }
                 s->vectors[startvec + i].pending = setval;
             }
         }

Igor

