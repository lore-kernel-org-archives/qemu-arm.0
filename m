Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp861991ejf;
        Thu, 11 Aug 2022 19:00:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6BPd29uffrSmVjyjhCweaQUEP5nxilV2dohPRoNZBMwrB1q7vC6AmuBr5A2fSERHzK7dBg
X-Received: by 2002:a05:620a:4724:b0:6b8:c82f:74d9 with SMTP id bs36-20020a05620a472400b006b8c82f74d9mr1373183qkb.455.1660269617011;
        Thu, 11 Aug 2022 19:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660269617; cv=none;
        d=google.com; s=arc-20160816;
        b=gxAXztW+0vHYEjhA2HUHHLmbjAqp5bEC+Q8n8fJHyDbPIATU8frrvCJqjM38FPeZv6
         RNYF+3cT9W+E6BsvmVUqUTsm6Nha0QwvuhXUjrVPfJRhk+trDz78zuD0uZMv3H7fJ/2J
         WnmI+eCHLdLeSxISGNOR+4LMH9S/2VU6kTKab1XUo1MBkdVvzLKVX20XlF0ODyL5sfsN
         BMvlWBRFs/baVBrKaP3HEfDJ8hffSMdkQCy3/1hfEpeS5j+j3t2qkoZ45BwuPc08tDVi
         PNMOk8fs9e3cQeLAKO8QBWoJPCf7XRz7HymNoDKcPDZ+ldbadR0aEQEvlSlpGIOHyO9d
         nNww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=C8+KqLztKYkJjjXYlQY59dPpn/wowHneDEgdExIgpso=;
        b=daXY6l26jlAH+1jzhpYJ1dRWWB4VKAnCBo1kG1IzdemCGNcmeTmmVPIBfDANDDgJZO
         DdA8fqxfoU4ZlzywB1OB/qUmWS77euw8BBFvnrdIPt8m2EMdUQGdTPLRwMg4GJvGJT0O
         cLDI5WWqu4Gkb6nCQW/3eNccY5pl+embwmJ/kEjSsRbSRY5kFq68bIdNLRdZZi7w2Kma
         P9IIK5QpLWyjg7ekuEVtSil5qiTixFO7dwqcXS4sNFDKbAZi9jInPu3a3GRsGbA6VJh0
         bfzORgUSti6rFLnxzio3J0Sgapi0PqDyE16dHyuuPnmzmojYAR258Z4tcA9rfOlGoQPE
         0G4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=X5NK068A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o3-20020ae9f503000000b006b8f3cfec88si489971qkg.446.2022.08.11.19.00.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 19:00:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=X5NK068A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMJyC-0004bh-GP
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 22:00:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1oMJxn-0004bV-IM; Thu, 11 Aug 2022 21:59:51 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1oMJxl-0007lO-7Q; Thu, 11 Aug 2022 21:59:51 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 l4-20020a1ced04000000b003a5c761aeebso309799wmh.1; 
 Thu, 11 Aug 2022 18:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=C8+KqLztKYkJjjXYlQY59dPpn/wowHneDEgdExIgpso=;
 b=X5NK068AQ6z4uyGXsX0ny1Z4794o9lvAEwL4D86uqCauTcNV7R64boobPju7RnAuZv
 +B4NSEp3aUkQS1GIm0TMEKvT2ygD384fpcy1qXaiLc4ANFWCMfJ1kSYISukQ4ptTwMp0
 ED4ZmF7jqxOwd8gL+Kp1l5nq/070YoS2DR6aQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=C8+KqLztKYkJjjXYlQY59dPpn/wowHneDEgdExIgpso=;
 b=uYLbStmVA9xpxgaNleQGjGwV8wx8qL29o5pCc4mRorq+u9K0sDf8VsZQOGNxIz9Yp5
 cYyDLsBi3LNzpzTeJoC/sVZtyBoc1w/0GVNdM79oko0f4mk0UC6r0QEPMiv2M/wHqm53
 EbVopxWGjGvbecwSMSxMvxOGGILYLgAukUC9P8+Vu35SoCsTCj7pt+7qf8gD4mG/jUd0
 JxGZ5vRJ1xrdaLLsWUPp0kXnb81VyFmBB9FrFcVxnplgfkNXZpQtUFec5OVv735+8Mh0
 Vu2koVtLH0Sbk9Eld+UHlj2lQBpKbqAreefxWr+8oRke7/vU1NFt0Jf8x5X8ZKssxyrq
 sPjQ==
X-Gm-Message-State: ACgBeo3laAlpCyyv7UJ+IRBQxCybqTjRaY3S5nIOe6+NT9YTbV6DTiJp
 SpSseGVYuPlMOA6coMzkqkgJAbc1PSG7NUnugY0=
X-Received: by 2002:a1c:ed0e:0:b0:3a2:d7d0:c607 with SMTP id
 l14-20020a1ced0e000000b003a2d7d0c607mr6866926wmh.147.1660269586853; Thu, 11
 Aug 2022 18:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <BY5PR12MB38917595B0306085EEBB1921B4629@BY5PR12MB3891.namprd12.prod.outlook.com>
 <CACPK8XfjXq6RW=M++UebfiGeij=GDSk5f6ZftNaL+2oeyCGnHw@mail.gmail.com>
 <ec20d3af-5f99-8e56-9352-75562c4548de@kaod.org>
 <BY5PR12MB38914647135A9AB3A006090CB4659@BY5PR12MB3891.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB38914647135A9AB3A006090CB4659@BY5PR12MB3891.namprd12.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Aug 2022 01:59:34 +0000
Message-ID: <CACPK8XeBu3-aUwYQPKbERWxrMCPiBFL5tRX9hQPNNJfcnKEOcg@mail.gmail.com>
Subject: Re: AST2600 support in QEMU
To: Shivi Fotedar <sfotedar@nvidia.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Delevoryas <peter@pjd.dev>, Jeremy Kerr <jk@ozlabs.org>,
 Klaus Jensen <its@irrelevant.dk>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andrew Jeffery <andrew@aj.id.au>, 
 "Amit Kumar (Engrg-SW)" <asinghal@nvidia.com>,
 Prasanna Karmalkar <pkarmalkar@nvidia.com>, 
 "Tim Chen (SW-GPU)" <timch@nvidia.com>, Newton Liu <newtonl@nvidia.com>, 
 Deepak Kodihalli <dkodihalli@nvidia.com>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=joel.stan@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: iKtSStK2xbSs

On Wed, 10 Aug 2022 at 19:12, Shivi Fotedar <sfotedar@nvidia.com> wrote:
>
> Cedric, Joel
>
> Thanks so much for the pointers. This definitely helps. We will get back to you with any further questions once we have looked them over.

Great! We look forward to your contributions. I am particularly
interested in reviewing your PCIe changes.

Cheers,

Joel
