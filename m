Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4585220wrt;
        Mon, 24 Dec 2018 23:28:38 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4h5xpGsTzSogxo2QPP/VA7lHAvd46W0Zj6s9oEWOdS3whyG0JQz77Ghku89qdXMJPUqkDF
X-Received: by 2002:a0c:95b5:: with SMTP id s50mr14654847qvs.64.1545722918574;
        Mon, 24 Dec 2018 23:28:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545722918; cv=none;
        d=google.com; s=arc-20160816;
        b=J360Vgq3Va06a4TXkizBXd8XGUTQm2qJAAYKzoVngxEFpWtiHWLZPtRHNBGES6LV5l
         /Puz2WP6zKyskeWBjIJPPYiS3aQNQM0dKVKA+pUe9MgnYfEd73ql+d64zYItF2BbJ1kI
         mfNuiVSyIamrUL/v+PltKbPClr2dakx3MwAnh3zkOiuPFL5hsbA7+lhlePJLTGlM1TxR
         7cNYo/St2ks0xYW3a1NIz8VNtpv3TCKnKC72kMXdcbHJANomH0J5Jt44SBgHwygxebjL
         Lld5TzeF2ewkdpMNiztU7QuEgjIKYFhQv8GRjIYmGBW72puiEYKX31ou9cyv86CjfN+f
         nYPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q8BFuv5rKj0v86s23yNCHpm1++fsewxQQRmSWRqYlOQ=;
        b=fT/qYjj+LIZscsLF0XkVSnasKrjCJ/i3CHjihbfWHRUSDpF1Enr5uszdEZSMim/xtN
         C/oP9ICVF0BNX51Lz4JFORf4CPKa4pJcHLVOGumRr8cGy0+4OChl8P+8YRE5btslZo+B
         851/SViPQTU41RpeFdWc9AP9fp7fv+d7ER+jsKntel/3g9boATa/sfB+/Ax6HU/Aebf6
         vI2wW74RsFf/i5YF0AsnIW2wENZyoCQxOm6yq3JLyu6uoaj1Ua4LPkQ7+5hYWUsnyXyK
         Rxmj/iODRw0wEnQ5xAqM5wP2OCpUauHMe7zhKD2FNZ7J+D+dq4icGidLFK2O4I6SY+Kc
         4s/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j2Dfhdol;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id w5si1727901qvi.223.2018.12.24.23.28.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Dec 2018 23:28:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j2Dfhdol;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:39978 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gbh8o-0000ZD-4X
	for alex.bennee@linaro.org; Tue, 25 Dec 2018 02:28:38 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stast.3vium@gmail.com>) id 1gbh8e-0000Yi-5n
	for qemu-arm@nongnu.org; Tue, 25 Dec 2018 02:28:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stast.3vium@gmail.com>) id 1gbh8d-0003GU-JJ
	for qemu-arm@nongnu.org; Tue, 25 Dec 2018 02:28:28 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:44166)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stast.3vium@gmail.com>)
	id 1gbh8d-0003Ej-EW
	for qemu-arm@nongnu.org; Tue, 25 Dec 2018 02:28:27 -0500
Received: by mail-ot1-x331.google.com with SMTP id f18so12039877otl.11
	for <qemu-arm@nongnu.org>; Mon, 24 Dec 2018 23:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=Q8BFuv5rKj0v86s23yNCHpm1++fsewxQQRmSWRqYlOQ=;
	b=j2Dfhdolo+n5SowW3gawu/HoUu0bLYOCIQ5rxr1GxPDkcJXo9UVT9HF3N6Fgowv1zl
	8CZ6ECBkhGThOEhdtXSycJnVodjgJ5MEwuwTxIsviTbHPujLC2E+t9KsohdJrJCQyD1o
	QVs6s/1CEmojeKOEweEarTam3BDPSfEnQP9teFeiXAwB/19ksdzzjE65AVGDn9ioQWTt
	R9vQkDNOXv2ggs5N4Wove/BoItbe4tPDbcQuozFSlOZnycL0aHuIAXzlmotjXu/JLOm/
	zPUdXfIz5psvUiv/32kOfacjjJFkHPPuR0I4RwFyBM6Ln8u8zxJMKcLMFz6///6AHNX5
	/e0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=Q8BFuv5rKj0v86s23yNCHpm1++fsewxQQRmSWRqYlOQ=;
	b=TsuOHm5ozTHtUwe8nDEHvhkRDs6UraR3lY2Pe43SW53oVI/uWh3ohKuVmInGUz9phJ
	uiTT39R5hJpy41EcDoiKUCw7xsV3XpBTyTPGWPHF+H+9v9bgMqY+SkrvZgc7zQGimiFK
	4jtzWXxslVgmttaIyJTQxsrCYnZhvLik9d1AP+IyBENXqhJzWG2v0rj8zlMbLbeiwgZl
	NZUQrl2qA5BJYLgMOLLfnAq++ueZ18AdN+1oGzAH7pjhTJwiByz4h7PV/yFCmPY+FEsB
	8Vx07KVO/9stZMyuPkSxYMNea7+XMAj19gcUGspNM0udnoyLWvwooX9PoRDLhHl145Ol
	FwIQ==
X-Gm-Message-State: AJcUukdtv+0fR5bgWu3C/hKUI2yHUYUGlGeINotS+jIYT2pnxJ+E0+Nx
	kLM/DVdOsfU+e6Cy5Jckjb+TdwMDJSB+zX2m3B1ASnUm
X-Received: by 2002:a05:6830:16c2:: with SMTP id
	l2mr10970990otr.20.1545722906739; 
	Mon, 24 Dec 2018 23:28:26 -0800 (PST)
MIME-Version: 1.0
References: <CAC-7+Cg5EX1qb11kwRprSE8_E2SMtEm1Cgh0OzFMCuiBhh+3BQ@mail.gmail.com>
	<CAFEAcA8qqzPxwYmjGG1Y940RFyuf0AccNy+N51HODnoKEuYSfQ@mail.gmail.com>
	<CAC-7+Cix_s3xdzqre8r4c8f2djDBi42k4oOvyG6C4VCC29Ww6g@mail.gmail.com>
	<CAC-7+CidVH8KGBaCKxeEricWKhago1w+-j7fDB88gnN1bXVy1A@mail.gmail.com>
In-Reply-To: <CAC-7+CidVH8KGBaCKxeEricWKhago1w+-j7fDB88gnN1bXVy1A@mail.gmail.com>
From: =?UTF-8?B?0KHRgtCw0L3QuNGB0LvQsNCyINCi0YPQvNCw0YHQvtCy?=
	<stast.3vium@gmail.com>
Date: Tue, 25 Dec 2018 10:28:16 +0300
Message-ID: <CAC-7+Cg-VJ9wivBYM+15mUs6cPUZ-Zu1Q818KieyjEVz02eLig@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000c709fa057dd3a881"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::331
Subject: [Qemu-arm] Fwd:  Run Kernel+rootfs for ARM Cortex-A72 on QEMU
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b80BRJDizqic

--000000000000c709fa057dd3a881
Content-Type: text/plain; charset="UTF-8"

Thank you for information!
Yes, I mean "virt" board.

Although there is no big difference now. I really want to see the logs.
If the board is not suitable for the kernel, the logs will not be displayed?

With best regards, Stanislav.

--000000000000c709fa057dd3a881
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for information!<br><div class=3D"gmail_quote"><=
div dir=3D"ltr"><div>Yes, I mean &quot;virt&quot; board.<br><br><span class=
=3D"gmail-m_-1222285124536088059m_-8025357515596374928gmail-tlid-translatio=
n gmail-m_-1222285124536088059m_-8025357515596374928gmail-translation"><spa=
n title=3D"">Although there is no big difference now.</span> <span title=3D=
"">I really want to see the logs.</span><br><span title=3D"" class=3D"gmail=
-m_-1222285124536088059m_-8025357515596374928gmail-">If the board is not su=
itable for the kernel, the logs will not be displayed?<br><br></span></span=
></div><span class=3D"gmail-m_-1222285124536088059m_-8025357515596374928gma=
il-tlid-translation gmail-m_-1222285124536088059m_-8025357515596374928gmail=
-translation"><span title=3D"" class=3D"gmail-m_-1222285124536088059m_-8025=
357515596374928gmail-">With best regards, Stanislav.</span></span></div></d=
iv></div>

--000000000000c709fa057dd3a881--
