Received: by 2002:a05:7022:921:b0:46:10d0:39e9 with SMTP id bs33csp427540dlb;
        Fri, 14 Oct 2022 05:23:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ZenWWpD0waz+l+7SM/9e0QLVeMUkqE2dqiQWY3DgAVst/BslrPxaxmTZgYY53TLVlhTrw
X-Received: by 2002:a05:620a:4311:b0:6d2:6870:c51c with SMTP id u17-20020a05620a431100b006d26870c51cmr3488037qko.566.1665750197192;
        Fri, 14 Oct 2022 05:23:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665750197; cv=none;
        d=google.com; s=arc-20160816;
        b=laS7TkQbxcO5AcZfwEfkIdoP3H5Q0lhE4wnMSSU22qRmYD+kq2LopYb/5D7Z+pOhPL
         YvOziTVsweQ+sTAqkNNQmJK5dpMt9fmss0IAqBxUHf2YqRNWiedFCS1BQJe8Ye9D3tyY
         hUZnqhSsCUN8MRyBTX6jop5qVcThpx/HJZruMr7+jRjQcf4vL7RzoULzSWfII0zO2RXH
         4+6uadaZ1xfmVoNAkKjHhoRn8GwO2YDqC0xMgQ5Upzw8kyZcynSQAlFrGobra7bENOeg
         7nqZMsRg9VDqeuQEhxj8b0J8FpQpBHgnh2b+CAMaUqRUwhATleBSt53d1vdPb//ajQ0R
         NA5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=GA6RjSBRKtbl8/W1dG1XJdVKJ0+TE/Z9kq8s/0Z1+ws=;
        b=DH/50JkZe+iy8BED8so3+dx+jPqdUSWHuHr1hRKi8PY5polZ963eH+5oxGrcBJwGuj
         eQDlPsAC1W9aNzBmwYahELirUOIDswMuMv1abFqZx/riQ2+zAwWuCb7FUm6ju0qS9b27
         l5h+zsCqPqGCS1TqAxBMiM57JyoLZm2GPGsPsWWosdEs3j0JmcyEBFtJCB9GytZEMNZo
         DZXzyrV/ulrivUJOnWxmsue1nrVD/X+3BAumhDriQE86fL/lAiZO2szYreGRyZ10B/+x
         Qyr8NPswb4OWOaMD66iecwHvZxS+7MrWSvd5Trdi12tdOR0AUuZ8X+RNpPZGctSJ0nTj
         6EqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="b/TkAf5+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16-20020a05620a291000b006ea54f0901esi1474914qkp.418.2022.10.14.05.23.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Oct 2022 05:23:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="b/TkAf5+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ojJid-0006AX-O0
	for alex.bennee@linaro.org; Fri, 14 Oct 2022 08:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1ojIC8-0000uJ-VP
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 06:45:40 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:45011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1ojIC2-00027H-CF
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 06:45:31 -0400
Received: by mail-yb1-xb33.google.com with SMTP id n74so5109204yba.11
 for <qemu-arm@nongnu.org>; Fri, 14 Oct 2022 03:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GA6RjSBRKtbl8/W1dG1XJdVKJ0+TE/Z9kq8s/0Z1+ws=;
 b=b/TkAf5+nI18K6G63JIGbyrvLCLRA+njni0McEENTDKW927oyETP5c9ETcPfQzt09e
 ydZmByxpuZbU5UcfK0CuryVxXAqkS19Y+bMtRFXzkIM29X6wMv/m+xCb6K2yqnvyiEPR
 CHanju1w3XPiChB3UM9yglR7fFdMgyssMdMFcLGZNDlJ2cnpGFo3ERd3cYQa9+kcHXHv
 VhMwrhadyfjZ4AeKap1jekIcZNfqdPTGWjUp8uO5iWkxltCeg0+D6+ZirNcQZN+DjjBO
 7+/wpFaL0ZnfoesDUj+uCEQONkZRhSS0xHDGLuT9PeoJWIVCLHeD4P8r6PgTDDZgLFtg
 5JEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GA6RjSBRKtbl8/W1dG1XJdVKJ0+TE/Z9kq8s/0Z1+ws=;
 b=tQxz1GHliVppRCJihM07Z7MbBksLRwM+chq39lEk6vGVVPdQ8cspeEQdBLWRJ1ILjJ
 lpclwN6jvPihL1VFOE7Gq06k36FazpL4QPtt8H5JcTtslvnRU0rcJrMopzr6k98VMo83
 JXJaD5OQ6dOzoYXN6oreluECO7cMwyeJOLOaY+6Md1oxX6g+79XUyosgNFBpHTneDYeU
 sphTtONu7eUIMaGq+LB3T3Nl5Sg7XOufQw4lkAkS5unG+nZ2JPZkmMzBY9ZTZMOcYrsS
 +z+zhpIZ3/X2D20kqDmF31b5bc/OBO8WORybiHkoJ7LJJAQkP4J+OMEkkGXo9i5aVfJD
 tMAg==
X-Gm-Message-State: ACrzQf0IB8L/9cNGUsG+ALsnqt17qeDBeCFrt3XYaaFpRTxnrZvprDmL
 irflIr4zA5o1q6MhjtLX2XSmtGHNXND/ag1yVaE1e13tniU=
X-Received: by 2002:a25:2d61:0:b0:6c2:44b4:edc5 with SMTP id
 s33-20020a252d61000000b006c244b4edc5mr3697887ybe.564.1665744327208; Fri, 14
 Oct 2022 03:45:27 -0700 (PDT)
MIME-Version: 1.0
From: Timofey Kutergin <tkutergin@gmail.com>
Date: Fri, 14 Oct 2022 13:45:15 +0300
Message-ID: <CACKEeRNFXrZ6Em1EyeZ6z=dniJd+-oOOQZO3mEtSvxikfp5Weg@mail.gmail.com>
Subject: No ARM_FEATURE_PMU for cortex-a9
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e8fa8b05eafc52cc"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=tkutergin@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 14 Oct 2022 08:22:17 -0400
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
X-TUID: /aEEmwrz+xC1

--000000000000e8fa8b05eafc52cc
Content-Type: text/plain; charset="UTF-8"

Good day dear Qemu ARM developers :)

Could you please clarify if there any specific reason to not
have ARM_FEATURE_PMU option set for cortex-a9 CPU ? According to cortex-a9
specification it does have PMU...

Thanks a lot and best regards

Timofey Kutergin

--000000000000e8fa8b05eafc52cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Good day dear Qemu ARM developers :)<div><br></div><div>Co=
uld you please clarify if there any specific reason to not have=C2=A0ARM_FE=
ATURE_PMU option set for cortex-a9 CPU ? According to cortex-a9 specificati=
on it does have PMU...</div><div><br></div><div>Thanks a lot and best regar=
ds</div><div><br></div><div>Timofey Kutergin</div><div><br></div></div>

--000000000000e8fa8b05eafc52cc--
