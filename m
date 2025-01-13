Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp1500441njn;
        Sun, 12 Jan 2025 17:39:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUGs2Z4Sd14djwfksaiE1XBI04jpwerwD+HJLSsM5LKvlZ1kGJCkfQAc/xGPSmpdaEzlOztg3mRHDs4Rw==@linaro.org
X-Google-Smtp-Source: AGHT+IHiXd1iEWWCiirNlPdRpmkouK62Hn+jv4beBQnM4+Fu41l+voYSUWDvgn5P8TAK7QSHvt2+
X-Received: by 2002:a05:6214:449f:b0:6d8:a4fd:d253 with SMTP id 6a1803df08f44-6df9b22d70emr318366406d6.21.1736732376869;
        Sun, 12 Jan 2025 17:39:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736732376; cv=none;
        d=google.com; s=arc-20240605;
        b=ItukCjEQbTz0VLmwdZv/gptD2XJnnECkvA3TSpDJLxfW38aGZNaDmEXr4+ng/v8RfE
         u1Bmza99OUAdvcvZbQocDtpiJB8cr7sR5Ph2ENMTNbaWF0UTuC//Ern5HvdInW+XQLqF
         aI7GbcxIl2GDiLeKixkLajLGR1wiEwhFXOkqnBJw2BLllxwalY/X9VHrnkKmmsfMGih7
         7RfxwJHTBCHBc8dE5YMn0wWp225axZIpNtlzv8//3x3b9FpaqZWOrp2axxnxvsDsl+qA
         z8IGcI+3cJ9rATuywdC85xI26hFSS3P7lKE86O9wbuFAkcjvm53zVX5kz7G+4Yb0Mz7d
         VQhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:feedback-id:message-id
         :subject:to:date:dkim-signature;
        bh=ISRYMyzoP+VHy0mXRpIgL9BiCzujAT8F3Qeyt/EnlzM=;
        fh=EIF1cTOMeBeB70/uAXrA3XkdwNLnfcAUUB7Ctn8hMeg=;
        b=J1MgZrggdvrDGFUR8C45Zj1iSIjc86hB+I7Ri+aR8EDSOFuRVMtOEH3EwQHZutpXCV
         rk2jCxKVXCoc5ohUvQ4rIEn1NZTb4aDFqb5clUYzoseZMoz/T4ewJzLfoTSFfOTJZDmo
         RoGTOizmayIZO1ab+ab3q2YYu7IdVD94eulNea8YO8E6WkCLbqxkKUfojWOVKGmxHjr+
         GRHE8NhHlla5QNqEf6QQKPxgMSpEAjhZZVhljAxubwhNUlg2EbRpHNz7lVQJJnnWcwKj
         HSlqKxNQLWge5H6+U5J0uzfGoSmb6TJ/qJ9Gkody5N350PoBlzTQ2SxrdRRli0r70Xev
         qgcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@proton.me header.s=protonmail header.b="lcV/BL86";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c87413131si74264931cf.504.2025.01.12.17.39.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2025 17:39:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@proton.me header.s=protonmail header.b="lcV/BL86";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tX9QA-0006kJ-93; Sun, 12 Jan 2025 20:39:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mdtymczyszyn@proton.me>)
 id 1tX97x-0004X3-NX
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 20:20:25 -0500
Received: from mail-0201.mail-europe.com ([51.77.79.158])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mdtymczyszyn@proton.me>)
 id 1tX97u-0002r2-J4
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 20:20:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1736731209; x=1736990409;
 bh=ISRYMyzoP+VHy0mXRpIgL9BiCzujAT8F3Qeyt/EnlzM=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
 List-Unsubscribe:List-Unsubscribe-Post;
 b=lcV/BL86A8OB0I16fxHz81ny8Y32sasgWStV1y+JHNwyi5sMewaZezKW267EeTDL9
 COeNuz/4E20hsqY2ZmA73fptprnHZ4Ys72Je7PPTmetr5/fjxVJI1Z76bQubgpMWto
 OFyaNSpsOw3Wo9w6iXDxwKHkfApAjA4RgF5WTXmDly8vOa0a4xITExNsI+8BIIwNNe
 dy2+YjjN1UOaYipDeVQdLXZmxXQ4IyEiz1mnBH5Aj4fo9EFzZlsRUipQ/G7PCl+Xnn
 buJmE8oaj+JTYmADVYA5mSMVw7PfZ4PGDzPtEwpHm1Om7ZUpqwH6HqFX/inuZpFJEQ
 yzKubI8JtasWw==
Date: Mon, 13 Jan 2025 01:20:04 +0000
To: "llvm-admin@lists.llvm.org" <llvm-admin@lists.llvm.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Can you emulate cross compilers written for x86 on ARMv8-A?
Message-ID: <V8-9mH_0RAMdFX4EVzJvHoDkKGgQnCZBdgFGLs4jNL-gZlRm-tb0YLlx2hmWss8Gidu2rC2IZK3RZiZk-v29J_AIpOdh_t4fi3d3VGEoeS4=@proton.me>
Feedback-ID: 54493216:user:proton
X-Pm-Message-ID: efe2debb6a4d8171eb621dc4410c3117933958ee
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=51.77.79.158; envelope-from=mdtymczyszyn@proton.me;
 helo=mail-0201.mail-europe.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 12 Jan 2025 20:39:07 -0500
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
Reply-to:  Matt Timpson <mdtymczyszyn@proton.me>
From:  Matt Timpson via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OduShMTDPFCQ

Hello,

The Raspberry Pi forums just banned me, and while they probably banned me f=
or asking beginner-level questions they saw as inappropriate, I feel compel=
led to clear the air. They didn't formally give me a reason.

I had one of those shower thoughts: if you want to run a cross compiler to =
rewrite x86 software to work on your ARM computer, but those you found only=
 work on x86, couldn't you emulate an x86 system just long enough to rewrit=
e software so it no longer needs an emulator? I understand that compilers t=
ranslate into high-level languages for a reason, even if I don't know why; =
and everyone who would speak to me suggested just about everything else, bu=
t for sake of completeness, what would happen if I did this the wrong way?


Thanks,
Matt Timpson =F0=9F=8D=89


Sent with Proton Mail secure email.
