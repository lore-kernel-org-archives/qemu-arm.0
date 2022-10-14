Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp401270ejn;
        Fri, 14 Oct 2022 07:27:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7obN0FemYGmEgltMXeaQ+N+1FHR+mhIUM3WmbMEFjrv7pkuk93TU7zfvmQTMXgG0PXJ7+B
X-Received: by 2002:a37:f61d:0:b0:6ec:cafa:4741 with SMTP id y29-20020a37f61d000000b006eccafa4741mr3820912qkj.761.1665757631431;
        Fri, 14 Oct 2022 07:27:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665757631; cv=none;
        d=google.com; s=arc-20160816;
        b=shVbQwkF1RKr0UI595EHXDGZjbDgz7vaqYQXBPHTn2oO1GhffS3AAX0Wfopdbnvn7G
         ywc/hLPx/Z0GaD7LDvgINc0EuowBFa0Gf0icvIxcy+YMeMOwUjJzCvDxjqPoTWkm+nP3
         ALRgIIpvL4P7qms7WEOQ/i+1somVWDg8kj4aQLYqd3SMGnEGL6Xx2Sshos3B0Di3LG8e
         IpjdwcB2JCpuRx9Iw09UkF5rQf281VJUOWpbomFEl7iLkbbjqRro5HwYVFLej7r8zm6c
         ryx0ULTJMEHv8oFKl6aEvAsYKoZi814AvB9SO3g+ncqNaO9xXtnGfNeUn5hywVRSi3ZG
         cN4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=X4GD3Q3cTiq94ohrNlenYaxBZn2CrJRwsWXCSdGj02Q=;
        b=SGMyps0PsXqiUNsvTZP4jdeJvXFwHIQSCztXC05EARbwBWZrWh3zAOJGbY6dVQ/aVq
         tb8s/EeF5xetcrYT+9iPISFdDt9mVWAG1+vlhjt1k7y2tX3cTTZ1MXFBe1owv4epn5Ay
         Ypr7lWT6fKK0CFTKnuE2g987nHXb4UaRCtnOUb6xBgUkn1KLnfx/VCPXKhlKcAxj/377
         zO8qogi+KVi9mK3Hd9+7sg9IaYzev/gW1AwwAigpT8WNMnSH4EntZljmLiAlE9ljTmvX
         9wJV8KTMswapWtMgiv+dtQY4EGxw9M7FJldmrEROl50ptijlEK253U5SkGEYWAghZWhZ
         qZCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=GZx5qZNI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e29-20020ac8415d000000b00398355bb813si1751482qtm.152.2022.10.14.07.27.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Oct 2022 07:27:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=GZx5qZNI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ojLeY-0005uS-UN
	for alex.bennee@linaro.org; Fri, 14 Oct 2022 10:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1ojLe9-0005qA-8U
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 10:26:46 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:43571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1ojLe6-0008UD-PE
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 10:26:44 -0400
Received: by mail-yb1-xb30.google.com with SMTP id 203so5777321ybc.10
 for <qemu-arm@nongnu.org>; Fri, 14 Oct 2022 07:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X4GD3Q3cTiq94ohrNlenYaxBZn2CrJRwsWXCSdGj02Q=;
 b=GZx5qZNIhjPc+1xRQFrX4xQVRnHVY3sNzaR2eHDLPIOiPTTZ+UOyUnhf/LyM1sxNXl
 ueeoy5xjlXnlZHR09Xqb+zg9Ct7uZaIedt0wyIYVfI6twuYtaJQKufJY7FeLPCVDM7t2
 1tL7TiroIR+yJhJMwTooHhERbBIKJ9uAEsMzQyK6RcACWha4z/5sENblQUjNQFqgY1SL
 sJ7azWq5gbQYTrlqesGASoE24/E9NxKIBo+G1RD0H7KIFzuclFQRIpWEv+x5vRGVoKsQ
 t1YPWU+F+9ovLePK/dtC/sFyJNSpAUHEY+KCUKbp3zJdc05gXyJ8bcrxoU7xuLIGIoN0
 51TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X4GD3Q3cTiq94ohrNlenYaxBZn2CrJRwsWXCSdGj02Q=;
 b=7Siy3DUKx83HGXhdiw5Ia+/CM284BZmcUw34gfpcS3ZNQK8D2reWK3jt38l1Rfg9yz
 7taj17DVOUiYn9ph4WjMjEueI2uPBayxA9ikNMyg+PVdT43SC1lm5sVimvoF54Rny8Mx
 1XqxRQLQYn/ObWIgF+B8gQqB1lIyQ1u9FelclF8uk1ta22qGTv9TSOhal6ACdyWuSYDD
 QkpwJxaiQFGDyrxMYgf+WWp2e01RLU9oVm9nmPsTHaeTeZYNRuOAao3Sy82DSw4R8zmM
 li5mRmb7CkL9V/GRIYicxEzEuJBvYZTvzAM9LoMYX5H1VRsZCdNFtao1awrG40VXOEIC
 zTkA==
X-Gm-Message-State: ACrzQf2RA6cFy6Cdx3V78OLSwqNT8zMilw09nfcQGEby7P3ZjaD0uixM
 7mXCCAo3EbUZQnIulExghgPAJsK3i/+vgezrSwg=
X-Received: by 2002:a5b:6c8:0:b0:6be:6647:888 with SMTP id
 r8-20020a5b06c8000000b006be66470888mr4624076ybq.570.1665757601567; 
 Fri, 14 Oct 2022 07:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <CACKEeRNFXrZ6Em1EyeZ6z=dniJd+-oOOQZO3mEtSvxikfp5Weg@mail.gmail.com>
 <CAFEAcA-5pSK55v7WtPNHK6oacucJpX55+esn-DQNJKo=GyGF1A@mail.gmail.com>
In-Reply-To: <CAFEAcA-5pSK55v7WtPNHK6oacucJpX55+esn-DQNJKo=GyGF1A@mail.gmail.com>
From: Timofey Kutergin <tkutergin@gmail.com>
Date: Fri, 14 Oct 2022 17:26:28 +0300
Message-ID: <CACKEeRMmN=ej78wc0=crwrdOU=H_w57vLVh+C7_MBZhazqHWnw@mail.gmail.com>
Subject: Re: No ARM_FEATURE_PMU for cortex-a9
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001f994805eaff6a42"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=tkutergin@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l6vIbjxcekeH

--0000000000001f994805eaff6a42
Content-Type: text/plain; charset="UTF-8"

Ok, thanks for the clarification.

On Fri, Oct 14, 2022 at 4:10 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 14 Oct 2022 at 13:23, Timofey Kutergin <tkutergin@gmail.com>
> wrote:
> >
> > Good day dear Qemu ARM developers :)
> >
> > Could you please clarify if there any specific reason to not have
> ARM_FEATURE_PMU option set for cortex-a9 CPU ? According to cortex-a9
> specification it does have PMU...
>
> I don't know, but my guess is because the A9 doesn't implement the
> PMUv2, but an older PMU version, and we didn't care enough to
> implement whatever the differences between PMUv2 and the A9's
> PMU are.
>
> QEMU's PMU emulation is very rudimentary anyway, so it's not a big
> deal that the A9 model doesn't have it.
>
> thanks
> -- PMM
>

--0000000000001f994805eaff6a42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok, thanks for the clarification.=C2=A0<br></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 14,=
 2022 at 4:10 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.o=
rg">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Fri, 14 Oct 2022 at 13:23, Timofey Kutergin =
&lt;<a href=3D"mailto:tkutergin@gmail.com" target=3D"_blank">tkutergin@gmai=
l.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Good day dear Qemu ARM developers :)<br>
&gt;<br>
&gt; Could you please clarify if there any specific reason to not have ARM_=
FEATURE_PMU option set for cortex-a9 CPU ? According to cortex-a9 specifica=
tion it does have PMU...<br>
<br>
I don&#39;t know, but my guess is because the A9 doesn&#39;t implement the<=
br>
PMUv2, but an older PMU version, and we didn&#39;t care enough to<br>
implement whatever the differences between PMUv2 and the A9&#39;s<br>
PMU are.<br>
<br>
QEMU&#39;s PMU emulation is very rudimentary anyway, so it&#39;s not a big<=
br>
deal that the A9 model doesn&#39;t have it.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000001f994805eaff6a42--
