Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp821464lfk;
        Thu, 18 Nov 2021 07:46:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnBus7nf4iLej44ANKmdQ795IRAYB0bPWeLSk8diU5cP5/XDKvPhkAHSqExYI4JC2d1lbV
X-Received: by 2002:a05:6122:a03:: with SMTP id 3mr105227142vkn.8.1637250407597;
        Thu, 18 Nov 2021 07:46:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637250407; cv=none;
        d=google.com; s=arc-20160816;
        b=r791q5vwKc9RDFcih3K+gkL5BlsSmYuY2IQZn/OMLZZged0I2amfKxE99Ap912nEL1
         Aroxrf+wl02NAqCbcPAzj6gZKYSXkWF8HS3xFFvCGS7Ufxqum03o0WCV8KtzesQ1hht7
         lAPcgV5Gcfk0UslAsA8UypCZxgmyHolz+gt8+78pC2twBtq4fY1BT+im0KjF5DbQEAns
         XmQFCwzltLiKnOxvaCOZi+09rCc9OayTmh7Gzn8H9wm+FkZ0b6quHQMffTtErtcYAcqc
         rTASnAftXPBlpdoaxo7GcVRD6ZdDSM+3oj1sd9idHiFpoMeUMk7EdBjZHvFRYUbEjkvo
         J0Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=j3usTi8MUgevgXgaJYjoJ7l3qkzzserqWMCmRvwhJVA=;
        b=zykR+smsrTAamd+B5i0AL/jX0f3A/5KgNrBf9wrDSTNxt07NLFW9JYiMtsmklFnlJG
         uhcmhtBh+ry4HJ7VP261rMW70BSCzIprhX3DGo3r2q4NMI8NKQXe8xhkKiE85TnXi7FM
         /ij8gFVABtdNp8efeyo9M0FuwGzVLmClz81VcdopHEYLIMSVP72ggcGeHIhDVd/osECa
         7KBKcFl3nkM6gTiXR3Lr3c7mI3V4AdoNS5Qr1BscUEetesWIRNVxFFoXU5TzSketHErE
         jrmKGgOGk+T0cb6X+q+7SMEZjDOuba4l+DOdO3BOvgFW68aRV1U3+6e4HASXR1/TQ3t7
         v7VA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=gpUMTfW1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ba14si103988uab.175.2021.11.18.07.46.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Nov 2021 07:46:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=gpUMTfW1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnjcc-0004xi-Sv
	for alex.bennee@linaro.org; Thu, 18 Nov 2021 10:46:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1mnjCl-0007le-1r
 for qemu-arm@nongnu.org; Thu, 18 Nov 2021 10:20:03 -0500
Received: from [2607:f8b0:4864:20::231] (port=33562
 helo=mail-oi1-x231.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1mnjCj-0003eU-30
 for qemu-arm@nongnu.org; Thu, 18 Nov 2021 10:20:02 -0500
Received: by mail-oi1-x231.google.com with SMTP id q25so15119479oiw.0
 for <qemu-arm@nongnu.org>; Thu, 18 Nov 2021 07:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=j3usTi8MUgevgXgaJYjoJ7l3qkzzserqWMCmRvwhJVA=;
 b=gpUMTfW104hJa8ZYLxdIN8c/0Fj1uf4x5+LgKCIxnpnSFrrMcaWqgiFVAHAuAWzP5I
 FwlLNv02ShnNSB7LmlLw6Y1uc4NMj5MJ5dLVCe+RHW54FlRPIHeYTHfZpphCxGa9UchH
 C/+sdY293tr9V+3DIMeW3dcRPPaPXidnZBWjIc4ghrtgvWBIMeGdZsT+38SFArTEa1Aq
 9zOPw+QA2G/zgz943HnUEvp5dyY9LFg9rSwSUbEyvrrQWaCcjd4PL5WrvB34eDs4AbMs
 cHHYH9T9i/mFefDHGHirb7tAVipO7v7cScNvr2NpZg5O95mejx5J7FhcaLY7egqVVk0E
 L2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=j3usTi8MUgevgXgaJYjoJ7l3qkzzserqWMCmRvwhJVA=;
 b=3GaZIskVVY/KYWVq5XMFxiVLMDJUSVOpoiM30y5SgCg08daEhi7CaDAjYok6TmF5Wv
 RJcl+hGqKUUKnIYoJWUdzOCBpWu8CLxrP5DKF4+fw1cSQ+Eh3ezMhZdtNlFh0PwfsExL
 ep9FUC4uJMM2j2iQu6t0a50Y7uzWxu7Rh7ExAZRL66R8beSpZsznqsRpTSQrIzRVUfuv
 bS+LB/31gfFXwlb43+6fhjHRgMuV0kVmH03ZHDXjmBqlGc6zFg0aoIQLroMI1ff3BceJ
 nzwhQbDbMFTjkOIHV0iISYVo1+56M+atobHd/fNvTqhlqgiUCwv9ICBxIK26Br9ga0Ff
 fLuQ==
X-Gm-Message-State: AOAM5318i7Wk3yuzbhKAd/9VLWcYSBkVqnkmhsnzGFOKIryMkbZG4Yha
 A/Jswf9mcTu6kB2X/Oo4ItcnCmTZtv4AQMS6j3/Sx86tuM0=
X-Received: by 2002:a05:6808:f01:: with SMTP id
 m1mr8801187oiw.166.1637248799111; 
 Thu, 18 Nov 2021 07:19:59 -0800 (PST)
MIME-Version: 1.0
From: Idan Horowitz <idan.horowitz@gmail.com>
Date: Thu, 18 Nov 2021 17:19:48 +0200
Message-ID: <CA+4MfEJhOsmUWmifkzJ7jSw8B0q7X2mJe=jist4AiTwhYd8Wug@mail.gmail.com>
Subject: DSB does not seem to wait for TLBI completion
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000147d5605d111b1b5"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::231
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=idan.horowitz@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 18 Nov 2021 10:45:40 -0500
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
X-TUID: EAf0BwooJb7p

--000000000000147d5605d111b1b5
Content-Type: text/plain; charset="UTF-8"

Hey, I'm running a bare-metal image on QEMU 6.1 and I've encountered the
following scenario:
After receiving a data abort and mapping in the correct page I try to
invalidate the corresponding TLB entry using the following assembly
sequence:

dsb ish
tlbi vaae1is, x0
dsb sy

Unfortunately this does not seem to have any immediate effect, as upon
returning back to the source of the exception I immediately hit the same
Data Abort. This cycle of receiving a Data Abort and then updating the
mapping continues for 100s of times, until the TLB finally updates to the
correct mapping.

As part of my testing I also tried to replace the Inner Shareable tlbi I
showed above with the base version that only invalidates the current PE's
TLB entry (tlbi vaae1, x0) this seemed to fix the issue, which made me
suspect something was up with QEMU itself, as the inner shareable version
of the instruction is supposed to invalidate the current PE's TLB entry as
well as the others', so if the non-shareable version works the
inner-shareable one should work as well.

After digging a bit through the code I saw that the non-shareable version
calls 'tlb_flush_page_bits_by_mmuidx' which eventually calls
'tlb_flush_range_by_mmuidx_async_0' synchronously, while the
inner-shareable version calls
'tlb_flush_page_bits_by_mmuidx_all_cpus_synced' which also eventually calls
'tlb_flush_range_by_mmuidx_async_0', but asynchronously this time.

Moving on to the implementation of the DSB instruction I saw that it is
translated into an 'INDEX_op_mb' operation, but looking at the interpreter
handling of that instruction, it simply performs a memory barrier, it does
not handle any of the async tasks in the work queue (at least explicitly)
so from my (admittedly basic) understanding of the code it looks like
QEMU's implementation of the DSB instruction does not wait until the TLB
flush has finished, as required.

If anyone can point me in the right direction it would be greatly
appreciated.

Thanks, Idan Horowitz.

--000000000000147d5605d111b1b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey, I&#39;m running a bare-metal image on QEMU 6.1 a=
nd I&#39;ve encountered the following scenario:</div><div>After receiving a=
 data abort and mapping in the correct page I try to invalidate the corresp=
onding TLB entry using the following assembly sequence:</div><div><br></div=
><div>dsb <span><span><span>ish</span></span></span><br>tlbi vaae1is, x0<br=
></div><div>dsb sy</div><div><br></div><div>Unfortunately this does not see=
m to have any immediate effect, as upon returning back to the source of the=
 exception I immediately hit the same Data Abort. This cycle of receiving a=
 Data Abort and then updating the mapping continues for 100s of times, unti=
l the TLB finally updates to the correct mapping.</div><div><br></div><div>=
As part of my testing I also tried to replace the Inner Shareable tlbi I sh=
owed above with the base version that only invalidates the current PE&#39;s=
 TLB entry (tlbi vaae1, x0) this seemed to fix the issue, which made me sus=
pect something was up with QEMU itself, as the inner shareable version of t=
he instruction is supposed to invalidate the current PE&#39;s TLB entry as =
well as the others&#39;, so if the non-shareable version works the inner-sh=
areable one should work as well.</div><div><br></div><div>After digging a b=
it through the code I saw that the non-shareable version calls &#39;tlb_flu=
sh_page_bits_by_mmuidx&#39; which eventually calls &#39;tlb_flush_range_by_=
mmuidx_async_0&#39; synchronously, while the inner-shareable version calls =
&#39;tlb_flush_page_bits_by_mmuidx_all_cpus_synced&#39; which also eventual=
ly calls &#39;tlb_flush_range_by_mmuidx_async_0&#39;, but asynchronously th=
is time.</div><div><br></div><div>Moving on to the implementation of the DS=
B instruction I saw that it is translated into an &#39;INDEX_op_mb&#39; ope=
ration, but looking at the interpreter handling of that instruction, it sim=
ply performs a memory barrier, it does not handle any of the async tasks in=
 the work queue (at least explicitly) so from my (admittedly basic) underst=
anding of the code it looks like QEMU&#39;s implementation of the DSB instr=
uction does not wait until the TLB flush has finished, as required.</div><d=
iv><br></div><div>If anyone can point me in the right direction it would be=
 greatly appreciated.</div><div><br></div><div>Thanks, Idan Horowitz.<br></=
div></div>

--000000000000147d5605d111b1b5--
