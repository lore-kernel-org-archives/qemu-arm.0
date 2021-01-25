Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp569121lfd;
        Mon, 25 Jan 2021 07:28:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUdlP6ASkQsKj5xpwgHx5krjz2e4Ah5Tej09YOPn7ApyNNQmo0xcFMAahqVJjG+9o/RO7G
X-Received: by 2002:a05:6902:6a1:: with SMTP id j1mr1373359ybt.440.1611588491821;
        Mon, 25 Jan 2021 07:28:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611588491; cv=none;
        d=google.com; s=arc-20160816;
        b=zFMpGsLk4/2f7wlpLHJGQWGztJCCf350S83v/G93C1Kc2vC+jktO+LNTAzDxFl/VA+
         mgs1Apz1ikAO+C7LLBLmXIDGscfJi+gVmyjjCL8miWIpUGdH7LlH+JdxGjBPXscysRHZ
         Gp3vtGm2mNDQFcOwugz6TYNdmE7Hm8cygM3yqA9IDx33RBmETSOdPIgRVwfeitgiTG7C
         Dv/ME1Uac3NFnosMxcKNVDhzb3G7F50XW5UOfkV4zv4ip8MWSdnQWHzx/RDvqA834+aV
         4aa0mW5Nf8Cy2IfZrAgbU2WYlPbz7uESHgR5Kl0kq5ry5NXKi4tREVFNsV0nXxj3gpUH
         islQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=GZ6hekqvldG8gMXqvg5p3uquzGRoC6fT/s0PAZ6iU4E=;
        b=LQTEdq1cOH2UmbHgxTnACiadv2mAx2FJsHzpgJa4Sr7GaNXJBwj29AKY3/I+1SjnIp
         eUG0P/F6ctDqRTsh5Qs4q6ciDVKkF+Q+Sz2jrXuPcQaxzE8cYB0IRe2JTRLzxFbmn1Na
         iT5r12ORqXLWjDK5wvNZ1JVTcZYFzBfbXLsWOiSoVDuDqk4kJl4z1SFkrPbH7tjUgf7G
         WT734lA4E9HoBzefC4RquVjKRe2lOT/t57v0VgIMTv4nUxbEriVSjfot/JXqL1OPFTlU
         NnOpsXQzY5Y8SRNRyAOK+E3GpNnZD+8I9SIYYpTtnX28D+ydfY6I2x4xAvGAd8QUpt8Q
         PtGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=cwI7pd2q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r16si7148367ybl.70.2021.01.25.07.28.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 07:28:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=cwI7pd2q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l43ml-0005h4-70
	for alex.bennee@linaro.org; Mon, 25 Jan 2021 10:28:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <po99h6@gmail.com>) id 1l3wnx-0006gB-Az
 for qemu-arm@nongnu.org; Mon, 25 Jan 2021 03:00:57 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:35195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <po99h6@gmail.com>) id 1l3wnv-0005BY-F2
 for qemu-arm@nongnu.org; Mon, 25 Jan 2021 03:00:57 -0500
Received: by mail-ot1-x330.google.com with SMTP id 36so11954561otp.2
 for <qemu-arm@nongnu.org>; Mon, 25 Jan 2021 00:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=GZ6hekqvldG8gMXqvg5p3uquzGRoC6fT/s0PAZ6iU4E=;
 b=cwI7pd2qxUW2atpX9r4oKTlej4g1m1MY/f56Dv7gygIaH2XhL6fJtA+R52sAgMAym4
 3377PjLcytg94stXYz/5+AgyksqN6jJZOj6LCNn9iSOnYavPqdG8G+gN4Sj5Ph3TDHYZ
 s3Xdp7Gpx4QfY+GV/2PN73qnUnsRGXpd6hxCUwh7/KMGVIX2JBKkJxqCmFGISNIoK7vt
 hQOUDZi03pTw82UMeJx+HHI6on8f52+T4308Fd8jenS2Vh+0ll8aaQca0uB7UXKAkFYH
 KJ37UGHJXnXsggiy67L3gsLP69Q6RSI3jw4lgXzVLKEViSQaWCbNIt4OSKgZ6d4kYKCE
 LHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GZ6hekqvldG8gMXqvg5p3uquzGRoC6fT/s0PAZ6iU4E=;
 b=RmgKpuA2GArBRJrNWqzXle0l4P0q0Y7KHXfJzCoa7aeXXHkPqxAF9qVycf6rCWJe4Z
 7t19iTPLyLn0q0W5v498FXZos5vTICzy1vKNPrIslS0zcYGQCkmIaOnWXoViMvhixMur
 EgtVrIVBdG/Bo47tWuPc0M6awNSL3ughzX53OdpyHQjxDM1ZK+lOOsCGieC1eQrHWsHd
 AoCvAsw2n7UgLrTtPTakhNmu+QGHAteTsKDwDootGnxk9oCL0FUAS17JLVBOq6JFMBgu
 RbwsQIywUB5f5UT5JpH34gt2/XgimTKjjJ1ReGZWsFWLV5MGxiCgIaqgYH7aWW5FLuMZ
 3XjA==
X-Gm-Message-State: AOAM532vWP2cunkkVSAenDEg3jpHaioL0pkE29gtyzbglT67/eU86Dzv
 JTLALI0jIBmDzmjXJNq3WUnzK8k4903Mz/dq/5r79RWJ9tI=
X-Received: by 2002:a9d:313:: with SMTP id 19mr607405otv.147.1611561649651;
 Mon, 25 Jan 2021 00:00:49 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?2KfZhNin2K3Yqtix2KfZgdmK2Kkgw4Y=?= <po99h6@gmail.com>
Date: Mon, 25 Jan 2021 11:00:36 +0300
Message-ID: <CAOS2wR_7b5hjr6WSWZ0KqXjEFT=cR_TAEiW6fgAs_a4HnZtz9Q@mail.gmail.com>
Subject: question about qemu user static
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000af82f305b9b4ef11"
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=po99h6@gmail.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 25 Jan 2021 10:26:47 -0500
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pjqmViYjV287

--000000000000af82f305b9b4ef11
Content-Type: text/plain; charset="UTF-8"

why is qemu-x86_64 user emulation is 64bit only
like if I wanted to install wine and wine has 32bit libraries
or if I want to run a program that has 32bit libraries
so I don't know what's going on with that x86_64 emulator can someone tell
me?

--000000000000af82f305b9b4ef11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">why is qemu-x86_64 user emulation is 64=
bit only</div><div dir=3D"auto">like if I wanted to install wine and wine h=
as 32bit libraries=C2=A0</div><div dir=3D"auto">or if I want to run a progr=
am that has 32bit libraries</div><div dir=3D"auto">so I don&#39;t know what=
&#39;s going on with that x86_64 emulator can someone tell me?</div></div>

--000000000000af82f305b9b4ef11--
