Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp2418736njn;
        Tue, 14 Jan 2025 05:48:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXyTsOFfbGXFK4zJsuS2Dnn4mfUbztdIb6gZnBCjM9yo7caAcXooBgab4D0DDiE5nmWS8ongQ/E/Sk/cA==@linaro.org
X-Google-Smtp-Source: AGHT+IEguIMFOSbQ0fTP+XDXtyodkSbyiWbs06W4GZJRhz+sA194e8SkDPdst7VG0N7mhzfHiPhx
X-Received: by 2002:a05:620a:2846:b0:7b6:6e7c:8efd with SMTP id af79cd13be357-7bcd97d55c6mr3816087285a.58.1736862527202;
        Tue, 14 Jan 2025 05:48:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736862527; cv=none;
        d=google.com; s=arc-20240605;
        b=jNR18v+Ic5cW472b0inPraiPnh3LsgYZjsCbIjij58FKbdWFcY/h/X//yBztWg+4EO
         EuuLudm1P6vsYBRjEdy2m8XzaIfGaNY+pQZWlup+TlZ8VulFSuxf/U4jLQeGACUUoZ1T
         vem0P4/Xh8hAhAuj/4xprHBYRnRxEQ9r70KIhjIkIHF2kHgjzhS3BMv/dTR6qP8pns4c
         L1HHGV7Y3IeUAHodC7l6RJOloqqmFst0vDIcwYeHF3ZJDJR9q14LscYfuQC1eRH2Q9/o
         EPdSHmugYcSMrRMpAoEsq+jNgwocvh3SacyGZEWTmQFnAhkYvqQqkDJ08GSCVXMGg8qt
         ltqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=G8vdR4kabr+DNc5tVlsGrY/ePJnH+q9AP9S8HbOzymU=;
        fh=cQXFM4qQOqALTsfL96L07E/OlgvWgnG2eeQltN+lISU=;
        b=DOsbqt3C3bk9rk94I8NYO3bqyWXYgdEngK16z4BwXhgVPdC0tQKPJi5i4EwVhpXYj2
         93Bc9/6waY27obGRvxoRHOG/BSj806NAZh1Vv4CHwxjSbhaJK4IT0wwHuLT/j62IyxTj
         LsjEvcexzyowwWmdWF3mibcBajUHA8HbziasqJPFen+d2Kq668nPped/mbtVmGKkehBK
         rQI1ioj0qAuWlCMUElYsXg7JxfI0sg3eRBNtTz900UgZ5Sy8d3U2nLEunEAO24i/JGpT
         1HcNc6luYfZX+yPoPxATehhC6GzzK0ilEU6f0F1eHxguU6aHRL+InXm9INa4DEyUiJnT
         ELEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=euZ1LukY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce3307c43si1368410585a.349.2025.01.14.05.48.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2025 05:48:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=euZ1LukY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tXhH5-0003Sw-4T; Tue, 14 Jan 2025 08:48:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tXhGz-0003Rw-Sr
 for qemu-devel@nongnu.org; Tue, 14 Jan 2025 08:48:05 -0500
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tXhGv-0000dU-Sw
 for qemu-devel@nongnu.org; Tue, 14 Jan 2025 08:48:01 -0500
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-85c61388e68so1142684241.3
 for <qemu-devel@nongnu.org>; Tue, 14 Jan 2025 05:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1736862475; x=1737467275;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G8vdR4kabr+DNc5tVlsGrY/ePJnH+q9AP9S8HbOzymU=;
 b=euZ1LukYzxO9QJ+atXN4ji6xxvqbmVdpjiQx8gGAagkF6LPQIHAwKyFVgdQRddceY5
 7uNKRIhWcH5rGzVLpCI7ONsT0EJ4TaREM+4IENr3hsmkGi5AdgFfk0Zcn0+Wt9lU433Z
 JwmSqc6evEdgIrVU9Mz1rpnTbotYBEHOyBcWlGvqSDAZ39mvu9wPpfb/Wq6ebqbBOFj/
 5lzEwfsfezqJy/PQC74v7UScuNs+m8iX7SGT/In1Vm2845PndgTIpT0ry866uv2C9mDv
 B3NXCwyb4we2yD5DkQaTrfIta+F4EnsZ1gVMBezCId70ifm6LgYjsCGHc1rhzlfZPByz
 zr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736862475; x=1737467275;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G8vdR4kabr+DNc5tVlsGrY/ePJnH+q9AP9S8HbOzymU=;
 b=KZs3t9XQX60J+f364ymCG7tiBWC62DkZ/LRgUELGBgM5WO5z4t9+fDws3TmIx/lX7V
 bI1V/jUo/GxKV9NJP3q4vDzQGT7qEuGzvmMOqSUoc9NTlt0F73ccnmBlG0q5ZXnYTOxT
 r3Lh/nfPP2hFVUGkleZXuNwEQOECjhQDmRN6TJXr0r8OC+xIanJU9xRDCIiFSG3DSIml
 klLUGYG92+YcXHSeyGda/0BjfhYq7f91ZZShLGKVUdZR6LT5sSQP5zlAizB23sAM9SBy
 PGqN2W/CZ1afoDsauU2HedXNXpsmEugYMwsWDJBraDP/yRSJLzjTaFyG+9aqr54FNR2A
 bjoQ==
X-Gm-Message-State: AOJu0YyP99GUReYkU91QZTUBVoZ6cSoDX+Vp1uhuLM4fBYLj7oUzbSrG
 W6nJiMr0+z+uvH2WkDa1zqKQqOi7Q2UAr4d/Oa4n8qIqs2cbec9NxL1va8pxMG0hEfqGQKcmHWB
 41ZBNQpGwYjKL/o6E4XaZZE8hieAUt0k9ecsm
X-Gm-Gg: ASbGnctJaDxIfnJFtt2TuYLxU88qZ2+nLHH95nmraSsjuvOVThZYVThWquMKiLYUrzB
 Srhx2ViUHfN0K7ZKTgi1hK0/1ZpkI3Wa8yENwHA==
X-Received: by 2002:a05:6122:50b:b0:518:81aa:899b with SMTP id
 71dfb90a1353d-51c6c46b315mr19383897e0c.6.1736862474938; Tue, 14 Jan 2025
 05:47:54 -0800 (PST)
MIME-Version: 1.0
References: <20250112210056.16658-1-phil@philjordan.eu>
 <428a5e3e-966e-4dd2-9597-4f476e5c16f3@linaro.org>
In-Reply-To: <428a5e3e-966e-4dd2-9597-4f476e5c16f3@linaro.org>
From: Phil Dennis-Jordan <phil@philjordan.eu>
Date: Tue, 14 Jan 2025 14:47:44 +0100
X-Gm-Features: AbW1kvbTIUOpCYkMl1dW-iPRqYyBTkB0AdLzj04_87-7bzwS2YBcf9p_7ap1reg
Message-ID: <CAAibmn3AEBNQfw138TiDX3WTwWTc9FXs4qCFQ9QMy=6LCRN1wQ@mail.gmail.com>
Subject: Re: [PATCH v17 00/11] New vmapple machine type and xhci fixes
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org, 
 pbonzini@redhat.com, mst@redhat.com, stefanha@redhat.com, kwolf@redhat.com, 
 hreitz@redhat.com, berrange@redhat.com, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, marcandre.lureau@redhat.com, eblake@redhat.com, 
 armbru@redhat.com, qemu-block@nongnu.org, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d7c22f062baace07"
Received-SPF: neutral client-ip=2607:f8b0:4864:20::935;
 envelope-from=phil@philjordan.eu; helo=mail-ua1-x935.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +qXZWgkv9xjO

--000000000000d7c22f062baace07
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 13 Jan 2025 at 18:31, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g>
wrote:

> On 12/1/25 22:00, Phil Dennis-Jordan wrote:
> > This patch set introduces a new ARM and macOS HVF specific machine type
> > called "vmapple". There are also some patches for fixing XHCI spec
> > compliance issues and adding a workaround to a quirk in the macOS guest=
's
> > XHCI driver.
>
>
> > Phil Dennis-Jordan (3):
> >    hw/usb/hcd-xhci-pci: Use modulo to select MSI vector as per spec
> >    hw/usb/hcd-xhci-pci: Use event ring 0 if mapping unsupported
>
> Patches 1 & 2 queued.
>


Thanks!

It looks like I accidentally dropped Michael's Reviewed-by tag on patch 8:
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
https://patchew.org/QEMU/20241223221645.29911-1-phil@philjordan.eu/#2025010=
8082246-mutt-send-email-mst@kernel.org

Please add if v17 of the patch gets queued.

Phil

--000000000000d7c22f062baace07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, 13 Jan 2025 at 18:31, Philippe Mathie=
u-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linaro.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 1=
2/1/25 22:00, Phil Dennis-Jordan wrote:<br>
&gt; This patch set introduces a new ARM and macOS HVF specific machine typ=
e<br>
&gt; called &quot;vmapple&quot;. There are also some patches for fixing XHC=
I spec<br>
&gt; compliance issues and adding a workaround to a quirk in the macOS gues=
t&#39;s<br>
&gt; XHCI driver.<br>
<br>
<br>
&gt; Phil Dennis-Jordan (3):<br>
&gt;=C2=A0 =C2=A0 hw/usb/hcd-xhci-pci: Use modulo to select MSI vector as p=
er spec<br>
&gt;=C2=A0 =C2=A0 hw/usb/hcd-xhci-pci: Use event ring 0 if mapping unsuppor=
ted<br>
<br>
Patches 1 &amp; 2 queued.<br></blockquote><div><br></div><div><br></div><di=
v>Thanks!<br><br>It looks like I accidentally dropped Michael&#39;s Reviewe=
d-by tag on patch 8:<br></div><div>Reviewed-by: Michael S. Tsirkin &lt;<a h=
ref=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt;<br></div><div><a href=
=3D"https://patchew.org/QEMU/20241223221645.29911-1-phil@philjordan.eu/#202=
50108082246-mutt-send-email-mst@kernel.org">https://patchew.org/QEMU/202412=
23221645.29911-1-phil@philjordan.eu/#20250108082246-mutt-send-email-mst@ker=
nel.org</a> <br></div><div><br></div><div>Please add if v17 of the patch ge=
ts queued.</div><div><br></div><div>Phil<br></div></div></div>

--000000000000d7c22f062baace07--
