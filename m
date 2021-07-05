Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp1307837lfk;
        Mon, 5 Jul 2021 08:06:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy02lgFrjGMIxT/8gXVniEAItXwrp0FPgOvuIvflJ8bcX6VTbTat1uKqCeXCIGH2JbMB35N
X-Received: by 2002:a5d:6511:: with SMTP id x17mr16216956wru.212.1625497610570;
        Mon, 05 Jul 2021 08:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625497610; cv=none;
        d=google.com; s=arc-20160816;
        b=A1kTjbOK9FjpmYd3oHamZq7nj9iifayzz0EkH7dcH5D4VScw93E+HRkYMQ/BJ12CaB
         E7VvPGlyKbaRKvqzdM2ymKyXeBWv8B+Z8SvXnbXJ/JE9yDoxM+6fbmbP+0cUhBCd/yJD
         YKtHrATEAnqekua/l/aq12oC1nDEdaZXmvAdnZyFrrg7+uoc+fwCgO4YqxmRjQ4c1rjb
         HCeCbLttupMzLZr+/QUKXY8h7VVv7YJVufmDYlamSXHunSSFWz9ELjz8Pv8NSQ1yfOaI
         bD1TnJFpj5gcz+Ew3oeGaNMDO2FfweJRuB2njcoUA3ZvATh/0msDwFajgYYk0044Dq3j
         cXKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XFzxCojGEQxwidc9+pUIQcvzhiDcjWa9gDKDrpBWONw=;
        b=pUR06i765AlsKBuxP8C5ziSdxJoDBGounwkgI2n3o25gSKmcK8Q3ZjHG5ZD97KXFyT
         G6na+gIHOk3rIDsgC2QY2IPUn4O+CXW3DuSQmQXYmYZeBOOeKsYR2q9/tIcWMutOR0Yw
         dkLVrfK/1lo2llQBQSYZwIOdzG6dkXjCO6EJfSp5j4cStEZJndHK7LC9fEkBVYwqvETV
         umm4xuWgGAo+PIuJbZpzISftl4c1FhhnEluVzXvRr1Bh+IsmDXHZ+dF57NlHB8uEk0Ug
         fEZ4NIbBFtRlGCAsVRKGr531zFynaSzjsb2QGo0Ius9tRplarV2C4nPq9RCtptbRFap6
         SWmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l6bjsqCK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f23si11673760ejj.531.2021.07.05.08.06.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jul 2021 08:06:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l6bjsqCK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0QBN-0007sp-Mg
	for alex.bennee@linaro.org; Mon, 05 Jul 2021 11:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0QAY-0006vJ-Ux
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:05:59 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:41497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0QAX-000338-1J
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:05:58 -0400
Received: by mail-ed1-x530.google.com with SMTP id m1so24013424edq.8
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 08:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XFzxCojGEQxwidc9+pUIQcvzhiDcjWa9gDKDrpBWONw=;
 b=l6bjsqCK2NWFcv/qk2TMMSIxGSwsNFkKdzpNhPNHQEcejkwdZK/pT3xcoqPJo2T+Lj
 6Lm3JSY31uq55obPIn6iD4DzOMoKMPrR1wWqVTQZPaRBALr77ak2z/k5XCpatpEvrWYx
 IJKWCXgLdT3rfZqo1NVJKjGbccYHq9Wr7wGP7xMaZ1ETbAtjLojS25ejxzghBEKI7GbX
 ijxeXqH5PU+dvam5HCn5MQDw5xck4hyYk0KbP9MAYfhDoIH/n6xul5f9oReeae2uD1NX
 JSlGb7omQR/CexUPtVsQoJq3y1suVu2pCAEqdGvSPwSUCxyLNV36cxtLxrGaxcOKpDEw
 OLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XFzxCojGEQxwidc9+pUIQcvzhiDcjWa9gDKDrpBWONw=;
 b=X0ywctgNgeGkJrANYWEFRwDIkdZWrecuuWQuvc9SNw+qJA8B5PWTs0e6tMQn//dNJu
 0h8XQxYMi3I5ePNhMpyPIgNKx1fs++3+GNVJeIZZIT3vUVUTweJR5d4jeZCE487RLQL2
 wvtM76WVmqyzgh5XlVv3Vm3FLigit3i/+FWL0cLs2Cvhv3wMvjgbhkNlF2GQkZawkU7k
 3P72hc09H42WeBXsHyFFgsUmUDx2E101rehIbWMAqKrKLDti2pbhusKknmkZXFiDqfdR
 I46zBlvR8k8gJSmnB52KKgC246yBkYtpx5BHp/yVeApafWB1iZA8tZRu65WQAhNTekRX
 5pFQ==
X-Gm-Message-State: AOAM530GUp4yUK5bst8seywpAhwoqpxPutgZKKawpIk9NdIAAQGYaTiw
 YJ8sJfl+qM9tCdNiTPiaEavQ35L7jb2g9swdL9FTbw==
X-Received: by 2002:a05:6402:3452:: with SMTP id
 l18mr12891544edc.251.1625497555135; 
 Mon, 05 Jul 2021 08:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
In-Reply-To: <20210630153156.9421-1-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 16:05:17 +0100
Message-ID: <CAFEAcA8jp25Z6cJ47ZKiTSTJNGr5xCjgPffPuZmO2Jm5iOuxiQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] GICv3 LPI and ITS feature implementation
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OTF16hmMxTe4

On Wed, 30 Jun 2021 at 16:31, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> This patchset implements qemu device model for enabling physical
> LPI support and ITS functionality in GIC as per GICv3 specification.
> Both flat table and 2 level tables are implemented.The ITS commands
> for adding/deleting ITS table entries,trigerring LPI interrupts are
> implemented.Translated LPI interrupt ids are processed by redistributor
> to determine priority and set pending state appropriately before
> forwarding the same to cpu interface.
> The ITS feature support has been added to sbsa-ref platform as well as
> virt platform,wherein the emulated functionality co-exists with kvm
> kernel functionality.
>
> Changes in v5:
>  - v4 review comments addressed
>  - All kvm_unit_tests PASS

You forgot to CC Eric.

Anyway, I've now reviewed v5.

This is now getting pretty tight to get into 6.1 -- a v6 would have
to be on list and reviewed by the end of the week at the latest.
I think we might have to slip this to 6.2, I'm afraid.

thanks
-- PMM
