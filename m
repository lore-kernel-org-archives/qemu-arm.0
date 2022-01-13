Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp3137904lfj;
        Thu, 13 Jan 2022 04:13:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAQlrg1fYZlZOGtZqk3nwBh9MlM6gyyqhatzOD3gN/vTfsiPgmP6LVVU9GMy9HAeupxTyg
X-Received: by 2002:a25:cc94:: with SMTP id l142mr5199422ybf.38.1642076011696;
        Thu, 13 Jan 2022 04:13:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642076011; cv=none;
        d=google.com; s=arc-20160816;
        b=kS6KnmdFd8ECD1tFUZlgPC/lPLCjyWOcvvY3njjImTQYyxqu9/nuoGRSLyQ5C1ERlH
         G7XiOHxHvmF1oSHvdhauZR0LYRUIR/Z2+IuDDVBQZ5X4gGSVMe9vYCZ31vwFqIGV8sPR
         QSoJWba97aVMnOLkBVjtv9SzSDG9ZDkpUVur7RZ/96k/mkDdFu2Ur7eyLf03f2GEMSqQ
         CX50fdxGhX5QoKDGrYl1Or5Ako9fVSbKj4d9UlrNQAOshThwLhrekQ7VrerrfMY6VyUK
         L0mG2dDqX62C2HEpZR745uzDc/wWt+hYuETzbJ+W1jlsE4oxE6Fskt4uEj4x9xH/YAFY
         IlNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kk4nWK932Tv05QBY+rCwX7MLSuKB7/Th5MoZ2BNkuI8=;
        b=pYrl6jwICcTMgizmqmq6cRkMUau4/uAmZYt+hpujzO8ekM0C9f96aQNws5B+a2aPi/
         PXQH7hcTmQIrkAZvV6XqKTOLGUDv/SjAoMDqRpsCLPuZFFuTW3D3dtcQdqcJfQoL26pL
         RI4xf+eDeGEJMssoj7EPgtSb6e+WqW3INN1bICOPQtqVEe3aqV7oIRUARNvBJqOblV8L
         eMRFKA60bo6Ea0rX+68qQ28RsnOIkFUbeWC4Z4q6kn52HHMRiMDR6oammTlhEImj1GA6
         kmGWyTJP0bH+6d5GFyjzbSwOUU8QooVC5QvGanAsmEtaUVHdKii8lrZqxKrIzSbaQXxs
         jFqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NKf3dsCb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1si2075021ybo.10.2022.01.13.04.13.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jan 2022 04:13:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NKf3dsCb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n7yyx-0001GP-1l
	for alex.bennee@linaro.org; Thu, 13 Jan 2022 07:13:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7yal-0004cL-6G
 for qemu-arm@nongnu.org; Thu, 13 Jan 2022 06:48:31 -0500
Received: from [2a00:1450:4864:20::436] (port=39781
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7yad-00043J-6I
 for qemu-arm@nongnu.org; Thu, 13 Jan 2022 06:48:27 -0500
Received: by mail-wr1-x436.google.com with SMTP id s1so9598413wra.6
 for <qemu-arm@nongnu.org>; Thu, 13 Jan 2022 03:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kk4nWK932Tv05QBY+rCwX7MLSuKB7/Th5MoZ2BNkuI8=;
 b=NKf3dsCbITGbLG0Pbe6jmFbmmVRaDn8hR1CsPADzhnvHfbTM+Q6ngxIp39nYbxDPHY
 u7hRjA9SCSvDDp9AGKC4iibugGYqnzP110nDAXZZ0uY2Uh48LXn4HQiCIhkJOppLd2Ug
 Q/5WhJ8he5qT6q4Y4nAMcI6ATVp74wTwXQeAiAcCKEiIw5hXQ6ysDqgCQ/gSWJleR9gO
 4cvql0wQq4MS9ps5QbSgEeLUYNnPJLBSuvrnIs1ZK7anNtxvPdBQzTI7DmxyujHM5FcC
 9Xt5nZ64bd+/Per5QslLEWdQCBCwshagxkqv4Edst+6kAeMZFJoeDmzEknBG5eU5KFoD
 xuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kk4nWK932Tv05QBY+rCwX7MLSuKB7/Th5MoZ2BNkuI8=;
 b=51LdsWhGF937GRVVrR8fPx3zWNjvqm4RyDdDHTZGSdF0jWBhNqtJlk0KmhtB+JloZd
 2F9LxoEApEqXnku7qvcUDtZ4pUm7uKrrMhfzIhHOBWaOm92EdsM3JmYZBAtsVL+m9BPe
 OOLWt8zH2OSRAY/PxiI/tnBwKysxsQO+5A3vdlJ3rPxYf3hXS/1esg96BF0u/sFSlTA/
 Ze7/tMYYW0fqAr1pcmyySKY4bY+8qPrI+gQ9EYT9mw03nuP89UvQ1XhJhDpRIdiyajLh
 5BSBryOUsXjiRmXI7960QKapQgmkf0I9PRSYpZJcnnldZCYEGVY5onMnUvyKo2MdxV1f
 y8gw==
X-Gm-Message-State: AOAM5321hbvGgZRoLBjlKdxZIzASF/rV425uKMoyEBtgR8my61cdYD30
 EKRdbBxWPlKh8vLWuY9s25Lk8TTSc7rRJvG4GB09PA==
X-Received: by 2002:adf:ee0e:: with SMTP id y14mr3794615wrn.172.1642074501247; 
 Thu, 13 Jan 2022 03:48:21 -0800 (PST)
MIME-Version: 1.0
References: <20220110214755.810343-1-venture@google.com>
In-Reply-To: <20220110214755.810343-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 11:48:10 +0000
Message-ID: <CAFEAcA8Bki2dpyptkSibz5=t9Fvy-PN8SjD=Z0PwcssX3MprRA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Adds designware i2c module and adds it to virt arm
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, imammedo@redhat.com, crauer@google.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kheubpZDfjoJ

On Mon, 10 Jan 2022 at 21:47, Patrick Venture <venture@google.com> wrote:
>
> This patch series introduces a new i2c module, namely the designware one and further enables this (optionally) for the virt-arm machine.
>
> Chris Rauer (2):
>   hw/i2c: Add designware i2c controller.
>   hw/arm: Enable smbus on arm virt machine.

I need to see a pretty strong justification for why we
should be adding new kinds of devices to the virt machine,
given that it increases complexity and potential attack
surface for using it with KVM; this cover letter doesn't
seem to provide any...

thanks
-- PMM
