Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9DCE8536F
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Apr 2026 14:40:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8fga-0004a1-Ir; Fri, 03 Apr 2026 10:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8fgY-0004Zb-Ni
 for qemu-arm@nongnu.org; Fri, 03 Apr 2026 10:39:46 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8fgX-0003IB-83
 for qemu-arm@nongnu.org; Fri, 03 Apr 2026 10:39:46 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-7d7422b4ff1so655929a34.3
 for <qemu-arm@nongnu.org>; Fri, 03 Apr 2026 07:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775227184; cv=none;
 d=google.com; s=arc-20240605;
 b=FsXTq4qq2SmKJJ55iBpVwCADQ7A2Zd6BLphwNoQ2vUCvAx+mGym8uNB2/pqsY6oPLy
 WEN7jtTAhSS+2Mt1avfks5xgr2FarjFBkBpremfn6yaZmCbkoHZ4TU88zfRsh30s41hL
 DgcslqRGr2xTFFG/gTKpaS2lE2CooFTfHzuJtfoSteEKAlHAhbzj1GSRJtnbs359h5hs
 C2xvvAkGKPEnfOVteyjm4XPF289Ycs1U2Fy4PzPUp6Bsy7G8kcalffH028uASvmRnGqr
 oNNKA9xcjKTf4afm6rNxPDvBvvIROqTiwCSMMtJ3JqXKSAwmCjCv+yaSBdnhmchk0YBM
 TblQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=XWmjx6emSszF2gy2KB6vkQNFV+q4J6L4U/yZYz1jUl4=;
 fh=uUh9S5BodFqmOw8/JrR+hxDdJ3kbGGIcLFY/YHe2LTg=;
 b=jxqWkdMViQ2CwkbMJT9mbYO5VD9CIrkKz6fWb9TFnxXUmyiQgpi9SzJ1kGzlK3tuSz
 Q8se3j4Wiud7ePt9wE3IK+SkpEww8qAt6Nm/u8lLcxlHAaQH0VCwCc0ewfIKL0oGa/ua
 0Y2B94gGSvyiSsFON0646UjyYQjs/EVgEICYvRj54mFxZHQcnldF+C/eAhY/k8hiYSUP
 5+EesQOy9cN8VVYFdHOSBRaKICHIqS+XiCnCgIaznngvlRv6lWM2edsGoo0MW10h1O44
 ujEGXO+pu73woLvrg0XWphGj9WGjWdLDl3jJGsidIs0aNrilY0NQvFnBo25C7CNeDyxz
 tP+Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775227184; x=1775831984; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XWmjx6emSszF2gy2KB6vkQNFV+q4J6L4U/yZYz1jUl4=;
 b=j5SgeF/pH25myFwNXZBY2gx84eGerxAdDCypau2/X8Gcx4XKM9Khqspx94nwpRQXcY
 ZVN5NdhxH6tH0fdj84IR2jnWU1WDIoYXhf7KigTQdUZwQQ+ylqhoa5/WpKmloCqvh3Nd
 ZUwCcg8xLbn7qFbA7b/TH4SAcsAtbetYJuyUGw7qXZXqILKQ4+k0qcQMba3HZcqtRwZn
 c/0d1f+lF1K7IABP98xMlZOKY7K22D4B0Zcf13lDLS2p/3aJxulQ8EwKcyfQD2Jv5b8Z
 w1p+1xZOUI9ccIB5a7DKYWi73gq+qjWgcJZkPKUOy2D6D4wWE1Umd+hXUwarjDf/SrFr
 KMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775227184; x=1775831984;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XWmjx6emSszF2gy2KB6vkQNFV+q4J6L4U/yZYz1jUl4=;
 b=TRmJ/FX07St43VEg6D4gecMWKMnGx2CStDKQrIqjuAAVcgrIWdgjcci1rlNa9ax5rB
 1fLHBqyxK+xjXOW+nyPsGL5EmwROfhldpdln0c78YihmoS6VZtj59jzAnPfr2CcFesQh
 Ujd9SH4tXuh0c1MIYcTd3Djh6dMbCpDfBqb8mWbKy4zhUn12jMn/NJlIE4pwfUKyrSsJ
 Ghqa5d8b73RYeG6z8Q8dAYmcDLr8n/qItnme67yExQaOYlPGDL1jDc1STPTXUafxNKcK
 Zzg936iuRzjpkimYseuqn8dUtMw+8el1TLSuzUt4pfU37otzbhgAdltVFWGQqAfWcoKY
 Z0fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDOq6d5CGH/DvNmokJAlIaFaWcJ5HjkPNxDz7BUCOuqQmtg3NFOX0P75IwVcZkNdcijC5XiCI//A==@nongnu.org
X-Gm-Message-State: AOJu0YxkHUov0y7JdpBolz6/NvC8x1Uel8JrrunWB5kcd0EUWb8t2xYR
 xPqjwIJSkrXwhsh9RRUVenuqYdrZ6e2XLkc7Kbe6xzn3zhUhEcucmzBWjbGWToZqjnlFOcF3kPn
 ohMjgdhtvS0h5fjBc8g7NWLs94pWc/vs=
X-Gm-Gg: ATEYQzyPx9PRTp8aXWHd9kG5JfdK+j2cy4HfnOfLpQq5p8WaG/eyZexAE93y0DNPzHr
 Um9PqZ7ZnqxDJB6pk86PhMnU2Gi9isA9OfHqGn7gGYs8ba2Wb11NDiPhvLBu/kSk+d7tBuYDM7D
 L1jqxbUXjs7z2A4/AYpvnGFiS0ean0RXnrExfPwl/mz0W/fNSU8K9VqjC/Ol+Jqltdl8Ye3xsiT
 eokzhs7kx1tKWRIdSmqeKIMWzj9r+9/gsWeSWsYpUvyl9K8qP5DzWCCzRnHS+ZpqgJutCazvrce
 pfd6Zkg=
X-Received: by 2002:a05:6830:91f:b0:7d7:4a7d:fd40 with SMTP id
 46e09a7af769-7dbb754e5bemr1893025a34.22.1775227183858; Fri, 03 Apr 2026
 07:39:43 -0700 (PDT)
MIME-Version: 1.0
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Date: Fri, 3 Apr 2026 16:39:32 +0200
X-Gm-Features: AQROBzDDVi9VbKIpdDtRiPO-QKoRVQOb3yYWoD7q4EE8aLaP5o-M_L4UOWB7-mg
Message-ID: <CAN-aV1EiKRh-Zpb9=77rXYPD2uT7HZmeNfvVW-wAToT+gaVC=A@mail.gmail.com>
Subject: Question on preferred location for QEMU sample projects
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: artem_mygaiev@epam.com, takahiro.nakata.wr@renesas.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi everyone,

We are currently preparing the v2 patch series for the Remote-Port
Co-simulation protocol for interfacing with SystemC modules. The first
revision was here:
https://lists.nongnu.org/archive/html/qemu-devel/2026-02/msg01760.html.

As part of this submission, we would like to publish a sample project
serving as a demonstration of how to connect a QEMU Remote-Port
frontend to a SystemC backend.

The sample project implements a standard SystemC IP core and uses
several external components such as:
- libsystemctlm-soc: https://github.com/Xilinx/libsystemctlm-soc
- VCML Library: https://github.com/machineware-gmbh/vcml
- SystemC Library: https://github.com/accellera-official/systemc

We have a question regarding the location for this kind of project.
Could you please suggest if there is a preferred location or some
standard practice for hosting such a sample project?

--
BR,
Ruslan

