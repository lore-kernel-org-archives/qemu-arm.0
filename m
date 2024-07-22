Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2164037njc;
        Mon, 22 Jul 2024 15:07:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWb/kbtQiylGhvjhKGFLrGg32j4LbGQ9m6HvpSZUlb2G/Jksdsv+K4YIhxIuJ7SYRnncaC6wiZ6ZrpEcsgBwNLuqoLfJC7S
X-Google-Smtp-Source: AGHT+IEgBCxxIwpoR6TakMRSskw4yZxRDtolH88PKkzdwDunKDoO3rqqD9UAS0sjB3fmTMjwN16w
X-Received: by 2002:a05:620a:4008:b0:79e:ffa6:8d7e with SMTP id af79cd13be357-7a1a6509411mr1017980585a.14.1721686056046;
        Mon, 22 Jul 2024 15:07:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721686056; cv=none;
        d=google.com; s=arc-20160816;
        b=MYWVtygmb2REqWcQJRORH0XQP7xHgAMKSMQ2HKbW+J0V+juJ5zkvRZCRsGERRp+X3P
         ouRjIs+58XDLoFRuinLUbqnq8Ske1F6MI6oug28lfKtlTPvAcT2i9RH+fRwGERrzoi1c
         nwEcTO+6WEtfLiJmprlIVrqVeWv1wDf/xoRpsLrh3vOJAPhIfZLe6FEfaXje+kAD7g5o
         mhD9etXub3U0mV+jzDfqyspLyI6KoDZGpTd8vgs0Bh1uyElVdoMclS345m4gK5BHV0SK
         vOd9jXoLmK8eQeSHbXa5FQUtZMEPcTqCasH11dbGwb4ozfpJMHGESd9iQCy9Hy3/Shvd
         I+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JYZBXP2nXslwCWH7ZrB/pSTeK3jna5bS/B2OPfJZGj0=;
        fh=c6hIPfTjzMrhoLQnA+d1xBa/FXDD23+4FBp/+F0eOPU=;
        b=Po462v8pL9XwrvQKYt86x/s+VnDpfc5fgQ/gnxpDdh45XmlRxbGhhkNZNRCVRj+XMj
         O034DzBL8gt9fYIiIfKtlYgyr0qHLQBBwnTy3RKtdzTWWdcOqqqjRPDTJETJJrktBvvz
         3Cgg0GM1ns7AdX/IbeEvJPysPED3R+dZzI79jOGgeDDbhiidftxMB8LN/2qLV1Qr1FK5
         kAsbSj3xjJbqkGy2Z1YfwVLMlRjn9X7UT9anTyI2vUh+6r9pWasih2IJzyZ39gfGEmUx
         62lEEHNnXKCfORxRnKOGvNp5ovVkqNMWNHeZ7LWVkeGD8z8IJxvq2kXOc1spX9wyn/P+
         TqZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=aIyW7uih;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a198f9433csi894957185a.15.2024.07.22.15.07.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 15:07:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=aIyW7uih;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sW1BX-0000eR-Po; Mon, 22 Jul 2024 18:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1sW1BR-0000Zb-Bi
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 18:07:06 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1sW1BM-0000M8-S5
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 18:07:05 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-70d18d4b94cso1142063b3a.2
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 15:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721686018; x=1722290818;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JYZBXP2nXslwCWH7ZrB/pSTeK3jna5bS/B2OPfJZGj0=;
 b=aIyW7uih+Oi9yFW1AlOKXF421SIOjw3c2ueOkXNqE0Un27TeZVLPEkseUoQhjCWkZM
 cMkYtrIBQo6ujSZ/88zAvPlAYSMeBOldrkehgC38zXUg+ZTGbnAwjxCG/QcVIHJFxzIj
 8f9bPY+FGUdcZTxiHwqUzs4p7aHvCYf5T1KGhPXuYf+jiusSl5h6HDA9Oq8S/j+ScDEp
 /4DQf5IgaeGQhgwr2K71ylqstqOuQso8Q+rHjHuaRUZe30ZiABZppCzajO5eO1VBxiJy
 OjRg+uNbMJ+DjryBwEtlOmbTNomhop/p+uSc4p335rT7LDemoGJGKufSAdb9LZGd+QsQ
 nHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721686018; x=1722290818;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JYZBXP2nXslwCWH7ZrB/pSTeK3jna5bS/B2OPfJZGj0=;
 b=RYDrr1TZpQeJAF4qEnT06kk6Ceu4osPreBptBu6KZyweCILXJV+qK3nOUWz37/N67E
 mAAYeqINP3IuKo3NfFA8l0vz2Uwcx+dtSh6vBxegpl6N+PsVnEUKRyaF/mNVwkvfapix
 naCToFDVvJrCTeS9D7at720MRxDwAxMmw9q4xnh8sSxbiqdC7uIdxoIQcKvlg9bhaRWx
 +AplYHUfFf6QTjTE0TDhIEW13kYfQcIvciKTQ3zjh0YOyJQAVnDIGbUoFr6ZjxMuZ/vP
 g7DQZnPMngaqOKSYbjQUC3EaS/1OJkIZYIJ89gI1ETYdWCfHy7sBu/R0q3q4bIG8z9NJ
 9xLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqnQyxgxz24JdEABHpNRbzBx4Npm6FiyhoqGdfgS2shRv/4onYQsV/0XGCKVwxp7kWpfGfkpUxAZAtAeQ7VMAmMKBI
X-Gm-Message-State: AOJu0Yyv6bO92W6/Oy1tVpAfKN60aYzQ+T94db1k5VIb4L0ytqapchRm
 xHVbIthkYYwgRlR7DZsTjSYNLJ6X+9DU6+bSFJ3Fk6K+oDJPA2UCwzf9yeUxMslq9eVdlbsJrOF
 MHOreoFqn5AP0F680zhoRzkY1eSp4zRG7l9fODA==
X-Received: by 2002:a05:6a00:84f:b0:70a:97d9:5b9e with SMTP id
 d2e1a72fcca58-70d0efa95b9mr6412067b3a.10.1721686018163; Mon, 22 Jul 2024
 15:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240722214313.89503-1-imp@bsdimp.com>
 <20240722214313.89503-15-imp@bsdimp.com>
 <f3c9d0c0-1cfd-46c8-8524-cffbe5180d3f@linaro.org>
In-Reply-To: <f3c9d0c0-1cfd-46c8-8524-cffbe5180d3f@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 22 Jul 2024 16:06:47 -0600
Message-ID: <CANCZdfpPrjt8G5WWRPdMNWyb=hskk7ZCVS3HEAcway=XO=K3ng@mail.gmail.com>
Subject: Re: [PATCH 14/14] bsd-user: Add aarch64 build to tree
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000871f6b061ddd4382"
Received-SPF: none client-ip=2607:f8b0:4864:20::430;
 envelope-from=wlosh@bsdimp.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cPXjkeM5B630

--000000000000871f6b061ddd4382
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 3:54=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> Hi Warner,
>
> On 22/7/24 23:43, Warner Losh wrote:
> > Add the aarch64 bsd-user fragments needed to build the new aarch64 code=
.
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   configs/targets/aarch64-bsd-user.mak | 3 +++
> >   1 file changed, 3 insertions(+)
> >   create mode 100644 configs/targets/aarch64-bsd-user.mak
>
> Can we build aarch64 on Cirrus-CI? (not clear on
> https://cirrus-ci.org/guide/FreeBSD/). If so, could you add
> a follow-up patch to build that on our CI, patching
> .gitlab-ci.d/cirrus.yml?
>

We can build aarch64 host for bsd-user for sure. I'll see if we can do it
in cirrus CI.
If so, I'll try to add it to cirrus.yml.

This patch series adds aarch64 guest...

Warner

--000000000000871f6b061ddd4382
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 22, 2024 at 3:54=E2=80=AF=
PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">phi=
lmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hi Warner,<br>
<br>
On 22/7/24 23:43, Warner Losh wrote:<br>
&gt; Add the aarch64 bsd-user fragments needed to build the new aarch64 cod=
e.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0configs/targets/aarch64-bsd-user.mak | 3 +++<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 configs/targets/aarch64-bsd-user.mak<br=
>
<br>
Can we build aarch64 on Cirrus-CI? (not clear on<br>
<a href=3D"https://cirrus-ci.org/guide/FreeBSD/" rel=3D"noreferrer" target=
=3D"_blank">https://cirrus-ci.org/guide/FreeBSD/</a>). If so, could you add=
<br>
a follow-up patch to build that on our CI, patching<br>
.gitlab-ci.d/cirrus.yml?<br></blockquote><div><br></div><div>We can build a=
arch64 host for bsd-user for sure. I&#39;ll see if we can do it in cirrus C=
I.</div><div>If so, I&#39;ll try to add it to cirrus.yml.</div><div><br></d=
iv><div>This patch series adds aarch64 guest...</div><div><br></div><div>Wa=
rner</div></div></div>

--000000000000871f6b061ddd4382--
