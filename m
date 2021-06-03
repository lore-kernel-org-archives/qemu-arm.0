Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp300671lfa;
        Thu, 3 Jun 2021 07:52:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWEUa805THxBf9bqonf7vrm1TlbKgIcDIchGrA6AkeNS+zIG1o2RMh1EgMxwC4cde91M+d
X-Received: by 2002:a92:d902:: with SMTP id s2mr246632iln.278.1622731961945;
        Thu, 03 Jun 2021 07:52:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622731961; cv=none;
        d=google.com; s=arc-20160816;
        b=l655H1/44m74r5UyTuejNpC4bbETTc9eqWSY9mx3r4/K9Fj/hM9q5q2chkInz/33/8
         zijjrTOVJCvvCN/wi25YFRsVIGUTBsqyLwT1yoPmH2zYEL8SCspIb5E1DNbeNfOaXeB5
         V8oyTx1h5n68YLFLajRShWbDrlPeGQXmHBJOKVjJ1ev3Fo0YX7VRWVe3gfir5BgSsjv5
         migRG26hj5feSOCjGTT7hMuodKEnbiayk1JogXgwv2cJ6ofhroCMp/Op4p2VgH1+TW+K
         SuupNzR/ZBrDOLl5/ShCQEFmefj+pYS2l8iw6r+lZDvwPhGf2pr5Dx3ED5xOBYzSrDmw
         8U4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:subject:references
         :in-reply-to:message-id:to:from:date:dkim-signature;
        bh=9FCq5eR/0VpbB713oRggY726LTqK15wglCYtx+yV03w=;
        b=hvMfLgG0kAzlvxzeYbPZSoai4T+Y7V42uC6QikvEIhok10mdOi5nOnYQ6WXWQL7bm6
         CmzsfUQRAZmz4ZAP9wpJ08lsshlLgbMNRx8Eh/vt45rY5LLPsIjVsCr9Yh9/jcPtRhf2
         TWG7r9wemn2k0YsaBlOIyzsxfkjg2cQdYm2NFBkquPikca2P7xdFuvn/wZjPf89Ly0sO
         FCTHvg3oNIej8dqi5bNp1wfdPPkBgfqxGVB+aHLTnKIYNDJRBgBP6T6Fb3JNVTZK8oDM
         LTsdsa0Sj1MQFzfDb1ws5OT90f8ckXDZezeioMqMbHM77RS70oxuLW2CdTRaRJCOThhK
         QW8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oDua6DTK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10si3027008iln.50.2021.06.03.07.52.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jun 2021 07:52:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oDua6DTK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1looi9-0003cn-6t
	for alex.bennee@linaro.org; Thu, 03 Jun 2021 10:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loohx-0003Yw-9D
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 10:52:29 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:40684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loohu-0008WU-W8
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 10:52:29 -0400
Received: by mail-qk1-x72a.google.com with SMTP id u30so6150405qke.7
 for <qemu-arm@nongnu.org>; Thu, 03 Jun 2021 07:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version; bh=9FCq5eR/0VpbB713oRggY726LTqK15wglCYtx+yV03w=;
 b=oDua6DTKKhmjWF7LGwpXVtHmjUfFrIoST4wcihbD1HnyfIyMRbGr7MXcNrDPldAnne
 ctwBDdpLC+UoHJZIxAdpKy1I78MVtdwAnFaLPSTpO6MqpSQ6YcPSfG6Q0E17QKKH2cCd
 M8rtNbwYAedNpFKIV+8fHLAt14k1H3Juic4BbyYzoCDNh+tvChLojZGQbnba1XwLUbp3
 y5l43qNM1/yb7+Uf+mNKBvM2np41NNe/NRu8Pil1QGFGngj6a12lONhsjlmkZlZEnT5B
 jvb5KXa40uxiUPGuB4buJHlM7ciNjKkWeXbsNYW3wk7SHg/vJsxf2XjyAITo4wZKj7Kp
 r10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version;
 bh=9FCq5eR/0VpbB713oRggY726LTqK15wglCYtx+yV03w=;
 b=uj4dUigPQpbkzjYvZmSjCnzhIRkrNWymdBWkh1DJGy7t9VID1zkQ3a/wu+Se/zwRK9
 6Fl+HS7VEaZFwwCLaPeK2mD593x/Fe6j/6PyOFpca8as5ahMVtcbw1TAsJcnTstHZw3G
 lxpX+yixehTHB5V8TehM4dDcHTHo56sZEdl0YbfKtdnaqHgv9g+qyhl2tHRo2rq0l3uw
 jh5f59ma0Q8R/djUJ7c9zhWFAO8fQGzemSzsLTeHsu6kSAnZzN5oBlBgcbRm3alo2L+j
 QQgvb/0Earq/VG2pDnxc4QEUQJr9E926SA56m06e9AwAglTBmulxfnqADHMm/q2mJyOz
 LMPw==
X-Gm-Message-State: AOAM531wLfOlC2OLDVm0Q6+tl5hMSzXOLcjAD4fLJYpCv5Ne59ivDKlW
 WqTZRyqtHQVIJ/UykWc40/wsrw==
X-Received: by 2002:a37:7844:: with SMTP id t65mr32878385qkc.429.1622731945976; 
 Thu, 03 Jun 2021 07:52:25 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.gmail.com with ESMTPSA id d28sm2029562qkl.105.2021.06.03.07.52.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Jun 2021 07:52:25 -0700 (PDT)
Date: Thu, 3 Jun 2021 10:52:24 -0400
From: Shashi Mallela <shashi.mallela@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <080352B7-06A2-4F59-B49B-B4E0574974A4@getmailspring.com>
In-Reply-To: <CAFEAcA-mGR3S_z7OEYhQwCOyYO_mX3QkbTOO_vcY3yz6OtbDUA@mail.gmail.com>
References: <CAFEAcA-mGR3S_z7OEYhQwCOyYO_mX3QkbTOO_vcY3yz6OtbDUA@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR
 writes
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="60b8eca8_7253685_139d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ekFlzqDZQVmf

--60b8eca8_7253685_139d
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Yes it does.

Thanks
Shashi

On Jun 3 2021, at 8:56 am, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Thu, 3 Jun 2021 at 12:01, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > Commit 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access
> > check logic") added an assert_not_reached() if the guest writes the EOIR
> > register while no interrupt is active.
> >
> > It turns out some software does this: EDK2, in GicV3ExitBootServicesEvent(),
> > unconditionally write EOIR for all interrupts that it manages. This now
> > causes QEMU to abort when running UEFI on a VM with GICv3. Although it
> > is UNPREDICTABLE behavior and EDK2 does need fixing, the punishment
> > seems a little harsh, especially since icc_eoir_write() already
> > tolerates writes of nonexistent interrupt numbers. Simply ignore
> > spurious EOIR writes.
> >
> > Fixes: 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic")
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> > hw/intc/arm_gicv3_cpuif.c | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> > index 81f94c7f4a..1d0964c9bf 100644
> > --- a/hw/intc/arm_gicv3_cpuif.c
> > +++ b/hw/intc/arm_gicv3_cpuif.c
> > @@ -1357,7 +1357,8 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
> > }
> > break;
> > default:
> > - g_assert_not_reached();
> > + /* No interrupt was active, this is UNPREDICTABLE. Ignore it. */
> > + return;
> >
>
> Makes sense (and looking at the comment in icc_highest_active_group()
> that says "return -1 so the caller ignores the spurious EOI attempt"
> it is what the code originally intended).
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Shashi, I guess this also fixes the assert you were seeing here ?
> thanks
> -- PMM
>


--60b8eca8_7253685_139d
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Yes it does.</div><br><div>Thanks</div><div>Shashi</div><br><div cla=
ss=3D=22gmail=5Fquote=5Fattribution=22>On Jun 3 2021, at 8:56 am, Peter M=
aydell &lt;peter.maydell=40linaro.org&gt; wrote:</div><blockquote><div><d=
iv>On Thu, 3 Jun 2021 at 12:01, Jean-Philippe Brucker</div><div>&lt;jean-=
philippe=40linaro.org&gt; wrote:</div><div>&gt;</div><div>&gt; Commit 382=
c7160d1cd (=22hw/intc/arm=5Fgicv3=5Fcpuif: =46ix EOIR write access</div><=
div>&gt; check logic=22) added an assert=5Fnot=5Freached() if the guest w=
rites the EOIR</div><div>&gt; register while no interrupt is active.</div=
><div>&gt;</div><div>&gt; It turns out some software does this: EDK2, in =
GicV3ExitBootServicesEvent(),</div><div>&gt; unconditionally write EOIR f=
or all interrupts that it manages. This now</div><div>&gt; causes QEMU to=
 abort when running UE=46I on a VM with GICv3. Although it</div><div>&gt;=
 is UNPREDICTABLE behavior and EDK2 does need fixing, the punishment</div=
><div>&gt; seems a little harsh, especially since icc=5Feoir=5Fwrite() al=
ready</div><div>&gt; tolerates writes of nonexistent interrupt numbers. S=
imply ignore</div><div>&gt; spurious EOIR writes.</div><div>&gt;</div><di=
v>&gt; =46ixes: 382c7160d1cd (=22hw/intc/arm=5Fgicv3=5Fcpuif: =46ix EOIR =
write access check logic=22)</div><div>&gt; Signed-off-by: Jean-Philippe =
Brucker &lt;jean-philippe=40linaro.org&gt;</div><div>&gt; ---</div><div>&=
gt; hw/intc/arm=5Fgicv3=5Fcpuif.c =7C 3 ++-</div><div>&gt; 1 file changed=
, 2 insertions(+), 1 deletion(-)</div><div>&gt;</div><div>&gt; diff --git=
 a/hw/intc/arm=5Fgicv3=5Fcpuif.c b/hw/intc/arm=5Fgicv3=5Fcpuif.c</div><di=
v>&gt; index 81f94c7f4a..1d0964c9bf 100644</div><div>&gt; --- a/hw/intc/a=
rm=5Fgicv3=5Fcpuif.c</div><div>&gt; +++ b/hw/intc/arm=5Fgicv3=5Fcpuif.c</=
div><div>&gt; =40=40 -1357,7 +1357,8 =40=40 static void icc=5Feoir=5Fwrit=
e(CPUARMState *env, const ARMCPRegInfo *ri,</div><div>&gt; =7D</div><div>=
&gt; break;</div><div>&gt; default:</div><div>&gt; - g=5Fassert=5Fnot=5Fr=
eached();</div><div>&gt; + /* No interrupt was active, this is UNPREDICTA=
BLE. Ignore it. */</div><div>&gt; + return;</div><div>&gt;</div><br><div>=
Makes sense (and looking at the comment in icc=5Fhighest=5Factive=5Fgroup=
()</div><div>that says =22return -1 so the caller ignores the spurious EO=
I attempt=22</div><div>it is what the code originally intended).</div><br=
><div>Reviewed-by: Peter Maydell &lt;peter.maydell=40linaro.org&gt;</div>=
<br><div>Shashi, I guess this also fixes the assert you were seeing here =
=3F</div><br><div>thanks</div><div>-- PMM</div></div></blockquote>
--60b8eca8_7253685_139d--

