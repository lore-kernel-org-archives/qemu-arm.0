Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1824631ejb;
        Fri, 8 Mar 2024 06:01:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVYHr9K1ha+Z7xI6g0KgNQzx8DKocWGBSZtd39yZpHsgrc6kh2X5TpM+F7PGCags46Ku+aKZQ7NzHG9aYk95CTWwMgKlDeL
X-Google-Smtp-Source: AGHT+IGlPj8R92K6iBI/FiiJ0KoksHAhajq2UWpm6t5fitdmfGt01BkL6S29xewl2Kn212KQ9f8J
X-Received: by 2002:ac8:5a91:0:b0:42e:f574:62c7 with SMTP id c17-20020ac85a91000000b0042ef57462c7mr70715qtc.24.1709906503783;
        Fri, 08 Mar 2024 06:01:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709906503; cv=none;
        d=google.com; s=arc-20160816;
        b=XtdOMEf+TbztzoR2YvwU27k7ZbSfC4wBu48mGde8zaL2Zu9HzH1aj7S6JbkoGRvSnd
         /0Dws+nDOl8+mW+MK7MdCJ/C/3VRVMctow5BdEru5Iw3SIF79YukD3DcxEbhn2sLh/yG
         eDH9Ng5EnF1rvvFTxBGZu+MRJF2Tv/RHBfu6rh/iSPRZbfwHcD/r3MRxUrWmIMkET0ia
         H4lPNgGPPvibWvG0YletvjDRbMhnhHFrIC5kvkyk9BoNtR3Iki91Oj9DVpb3ct00BsbB
         H9Vn5IYCr9ia3UEG+p02kSqSqbhe6bQUWjSbhGGi3btIA/aDkQJSyxRlDb5liDqtBDsg
         p1mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=EiDkqkQueAxmA5vFzDdxheodnPSSYHnOKc8PTuYo+bE=;
        fh=QYqpVkRpvDCxq95imFkGkpkKkCcBAkSjmqbaONNdAWw=;
        b=vioaoPGAqQKRjG7Hef85LqbPaqt/Li6Up1qDUyiUFdlal4E6e74+frtvEDtOVvE21P
         eUVI4IAp2SS7sXfdB2Umfghrkh1mLVdCT8nwUI/MsRN2dfWUzIrCfOoABVBYN5JJfUvl
         NLMVw3LSt3H9b6mpHUWvUvU8LmSnMPRjHb9ieopc4EjNOaCddQ0WsY7K1MpQr5/Ai/5Y
         Zb7Coi4/VZ8pdNRBmNnF5uWo/gEPoCZHDkSev5KgaMLTuDKJ8GqqauCc3XeYtKFvI9BS
         mG/rQ6qmlo+aT7bNg1bObsaR17ib0QASZJIkZEC5Y9QbtdMJV8GmeWKhP5Zi6JX2QL0P
         gNwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eihrPLpH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12-20020a05622a050c00b0042ec4b1469dsi6863982qtx.686.2024.03.08.06.01.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2024 06:01:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eihrPLpH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1riamG-0005bI-LQ; Fri, 08 Mar 2024 09:00:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1riamF-0005Zt-8T
 for qemu-devel@nongnu.org; Fri, 08 Mar 2024 09:00:47 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1riamD-0005VG-Lr
 for qemu-devel@nongnu.org; Fri, 08 Mar 2024 09:00:47 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5673b5a356eso2477074a12.0
 for <qemu-devel@nongnu.org>; Fri, 08 Mar 2024 06:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709906444; x=1710511244; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EiDkqkQueAxmA5vFzDdxheodnPSSYHnOKc8PTuYo+bE=;
 b=eihrPLpHNNBWE4A8YqpbeJLkkViqZCMSQd5fkIV5kM2Ry4zsYEIR/4UtsMSYzyeBsA
 K9Kc0pjv/tlitumfvQtp41UGzLo48SXuwFiPdwbXMIu1N/3NfXXHIRkQj17F5oT+3mwa
 WCwcb+BOAr6L55KCDSdQoWgzmMit5xSAFFF6NVt3RisQULOjjomeQFw4Y5DDgYq9GxVi
 wnyh/cYSjflwMuJ7bZOargcAnJt4qV8o9b1A7+6ykpSfU+PFRiQQ1Zr9fLoYLP/ZD234
 mGMBnNFWDLNJi8LFxzbnttleEZ67lsnadXDK8A76rBkbA2mRfg+5fMf5slRLkYgdJFHj
 6N0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709906444; x=1710511244;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EiDkqkQueAxmA5vFzDdxheodnPSSYHnOKc8PTuYo+bE=;
 b=Z5W7ELXUM1+EC6fulisnKbjdpNKJPHFWnsfJHYabh2eKgjCG3eJUs6cmxkWRWk6RiK
 a4NSXWp8RQti18sUgCL5Xpy8l+M9ObihXKUDsfHn2qajDf+Uvoon6Bsxp4tfsiQ2gaGY
 RDU1FsI4EpivdGoPd+qtZfjGUkO34getsa5qdydr7rC1XCo20bKf3r3LsJ0RKHCe74bP
 Kn8u4hEW1Prim9OHMJdYPlnaJkAGV3q1jrum+/O0RqUnfx2o9RVTLLyV/MZntsZIRtD6
 6XPqxicqi3e8A7G6LBnVlk3275OXkkp9fcdJOAt86242QhRSB9itXAySOqze2ZdhJk+X
 2XNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCcVdgesVEXtUoNLutGZc0mftcByFjV2zt8C3X5PSjrYo+7i37Ci56YSalO6GhNoWondpzIJKMSWiGTytsC6XqBvYpjaA=
X-Gm-Message-State: AOJu0YzBLehRP+6TidilAMyCQw0x4GcEcl8ngAMYWkquiNU1NcIioqgi
 u1w6sab1eVTQSEUBCT1zjTDDCvVlDqQeGTgsBljYcTi/53yvUupJ3lcTs6l+LfnzC8J4XX4swqh
 iqCySw2EccTbprexx00ruj5E5F/LS2kRJJfhYlg==
X-Received: by 2002:a50:9305:0:b0:567:a2d8:ca92 with SMTP id
 m5-20020a509305000000b00567a2d8ca92mr2025478eda.23.1709906444028; Fri, 08 Mar
 2024 06:00:44 -0800 (PST)
MIME-Version: 1.0
References: <20240129081835.137726-1-thuth@redhat.com>
 <20240129081835.137726-3-thuth@redhat.com>
 <CAFEAcA-yL8BAdtkF2xaWJOeFPUWRoBbuvPSEeorwjyei3oFjDQ@mail.gmail.com>
 <d0ed3f33-b641-4e46-bfaa-f21fbcecbeb8@redhat.com>
 <CAFEAcA-ye_3AqCkNS1acJ7GPzLEf=WCmjN3WXe9eRWB1x3y=7g@mail.gmail.com>
 <f952b2d2-90cb-4427-a726-ab126ade8e71@redhat.com>
In-Reply-To: <f952b2d2-90cb-4427-a726-ab126ade8e71@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Mar 2024 14:00:33 +0000
Message-ID: <CAFEAcA_oMMRdJ78PpPjCtT_TFaS0+yPhOH8Dc-qwrEEM_v+vsg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] target/arm/tcg/m_helper.c: Include the full
 helpers only with CONFIG_ARM_V7M
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: jliMe+pxwv0D

On Fri, 8 Mar 2024 at 12:54, Thomas Huth <thuth@redhat.com> wrote:
> I gave it a try, but then we end up again with the problem that I already
> mentioned in the discussion about patch 1: CONFIG_ARM_V7M is not set for the
> linux-user binaries, so m_helper.c would not get included there anymore and
> we end up with lots of link failures.
>
> So if you don't like the current shape, I guess this needs a little bit more
> pondering 'til it gets acceptable.
>
> But could you maybe at least pick up the first patch already? ... since it's
> a patch with lots of code movement in it, this is quite ugly to rebase it
> each time someone touches some lines of code in that area...

I don't object to taking the first patch, but... it doesn't apply
so it needs rebasing :-/ If you can rebase and send it out this
afternoon I can put it in a pullreq I'm working on.

-- PMM
