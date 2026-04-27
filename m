Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFB2FF8861
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 09:34:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHILm-0004bx-3A; Mon, 27 Apr 2026 05:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHILl-0004ZB-2n
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:33:57 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHILj-0000Ti-3O
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:33:56 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-651c5d525f6so8942362d50.3
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 02:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777282434; cv=none;
 d=google.com; s=arc-20240605;
 b=DoaRMQaDpyPMblwhctrm9szh80ovPRHnJf0swokhLt29GdRclSl0lZnevQO3LPfSOJ
 TWHtIX5ZoRz0rxv+ravH+35D7GxhER7LPk3UcThYMSodq1CrR1qY42iHBmWEeOhs7jHJ
 jCsctnGIx+eSIQIuGACdPgNfVVDtlPuK4zVgUQ9zpoKr+3FKhOvRi0cEHTQTcouQsQzs
 q3ImMaguAng4LR3BEFUIft+0kuyARfu+sjI8RHAR4VZC48dGA2xnHy3Y3qE2x9oq+Mtb
 C/qNPAWMjlgoOOJ6d3fvNfDBGxpz7h+P/XRKfkzn2e4J1FsBPKzr6XcKo+fIYakWK/Q7
 7OVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=WDMhoO4qmVr4TqrVTgUXX9ejcEjnyPw1rATst4OZikw=;
 fh=nuxFJHIhkWPMNw8hVsbBPOWBHE+ZfwkoNS6/2sT/2eI=;
 b=ilDOlIozk0xek6UHcCeSjOJT6YT8gl0iFNuUg1DKo14xVPUuvaKPZwIvGLPvoXLxwo
 geEjcl6/xgNzySFNMLJobXZVMZPNRxhlWbsZN4pehfQmNtM/DWPujZ8/VIv54CCz9q92
 DC3DewwCLijYA/pDyq4KX1pwFfUYYTedFMCAZhjVxwrxdmEp9vw0c/3atni5x5rougiJ
 HCopAY88cL3GPrWXrjFiIt0K4RYFaUFQjHQQg6w48E4OKhRSv8fi9v2qXVN4qazQ6mps
 pkuiFHhvr4NdIeUataYbH5tHSuRZsD5nX1vm1HdRDCLjZuVBCH6YP8WUI7FNwgax3/so
 Tzzg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777282434; x=1777887234; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WDMhoO4qmVr4TqrVTgUXX9ejcEjnyPw1rATst4OZikw=;
 b=URccwXWmqKqp6C1BVopoRAlzzADdmC63VL/SPbXeLQ8iFP43hdanaySML2qg5zhENb
 DOSuS1REFIhYu7VNKtyc18OA2zweFw66ETWYiA26HVqPagoH7MbhpZZmv7yU3MpGUCRx
 CdJEwrEkEmOLO9NcP3rfKVZ41FVhJLygKQPT06dJFn7KIGgd2EnAewcyyyqe+imQt05B
 gOoYHpaAV/3VOv2qLnsRyGhJIZBLpQ/zMRcVBKsPD93NvjMPngyAEqUBybM3zgoXp1Pq
 fWIDlwdSmLMCQ5C3UMC9gVz0KDvHhsk7RiF6GnQyde1sOzrw8FUwQe7KBmsaGwwD5tFl
 /dOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777282434; x=1777887234;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WDMhoO4qmVr4TqrVTgUXX9ejcEjnyPw1rATst4OZikw=;
 b=jhWczpGLUGgMPomIMGJmWTtRMLqeh4KwwoQn+4o+pWY26VPcuwWP2j2Brs2upDdhUw
 petf0cQEPQMfqSpatFgv8aAhXfYXtI8xlxWg59c2ZDYlqhzOz/Gy/xucZIfhEP1cw6w7
 hjYRfy1ZarX3ItpWvdGrUO7Vo1ugSHswyKYtx0B34RiJFSpq/6GeQxLRylCgZRqDyAaq
 5YRVdbh8hKcgRHZChQk8ycFVAuN+iXWa4Q/7ASHvVB3MgBkEDqycN6BbP+h7sozFYZeH
 0GRWhmS4q2iRPElNiFwAfZIH1R+qnG9wG9wmg72KNzgXTNsrSV8/vKQPlyO7fd4FAEMZ
 A9YQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Qn/22qsILQu+9un6AJEX37NPAyrsbF4E6Rc8Gt62nqXLCz84EP8wxg1llN9VDshMOlRQx+aOpUg==@nongnu.org
X-Gm-Message-State: AOJu0Yx6a1aErGWeEwWGim6zcNaQ680Wz8fxndWAwuf4VM1otPiRAvCj
 jSQg5xQGwcf0F7KEv5DAe9qqY5muxYV2O/dI4c2hhRv1g8bQq2j8ZCFK3MkJhq8ndvrnKBp1eHN
 GhGCTEn6w4Hxp+VqVCC0O5D4Qij4iJ+FCqTQM8GEMuQ==
X-Gm-Gg: AeBDiesB0UPVdAr89zMz5Mxg/mRy3pWSPZk3OXGW+2E5oskfC19TtJmnXCz8BrQYaEE
 YnBeuUf5T0SG5X52wJaWITBmdXi3e0InD27UcJ0JpbYzv/5o5vjyVKNSk+LXermI1WNFCzThpwJ
 /klcl3ku6uhWWS3rNcASd1HqaZprovKC9nahvtBga7sTSNyswP2meuaFDX/1WkqnAcUBBt/Odoq
 qh0067RjAMqdwW8TdcNPAtGicpv9vEqu3RuwJ511qgL9DLHk81o4pnyGQYaXLYKzhst8Ncaehk/
 PqraWvW2YfQebsokYnKuLht7PWmuySTLZXqeJ1/XBhiu7f7Uf4hso59JEjcolshkwbfQVacoST0
 VZA==
X-Received: by 2002:a05:690e:4191:b0:651:cf43:b28f with SMTP id
 956f58d0204a3-65310b0b5b6mr34988861d50.60.1777282433964; Mon, 27 Apr 2026
 02:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260420140552.104369-1-eric.auger@redhat.com>
 <20260420140552.104369-2-eric.auger@redhat.com>
In-Reply-To: <20260420140552.104369-2-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2026 10:33:41 +0100
X-Gm-Features: AQROBzCEfYlKMO6BLPiKHOze75SAjM8txBCN60gETZmHcEIrSyNBM-3rvsVv1u0
Message-ID: <CAFEAcA9kVBCFUwAmEQG7gK0F69PXFyALUsouG5w7zJQYzsx=Zw@mail.gmail.com>
Subject: Re: [PATCH v10 1/7] target/arm/cpu: Introduce the infrastructure for
 cpreg migration tolerances
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 20 Apr 2026 at 15:06, Eric Auger <eric.auger@redhat.com> wrote:
>
> We introduce a datatype for a tolerance with respect to a given
> cpreg migration issue. The tolerance applies to a given cpreg kvm index,
> and can be of different types:
> a) mismatch in cpreg indexes
> - ToleranceNotOnBothEnds (cpreg index is allowed to be only present
>   on one end)
> - ToleranceOnlySrcTestValue (cpreg index is allowed to be only
>   present in source if its value @mask field matches @value)
> b) mismatch in cpreg values
> - ToleranceDiffInMask (value differences are allowed only within a mask)
> - ToleranceFieldLT (incoming field value must be less than a given value)
> - ToleranceFieldGT (incoming field value must be greater than a given value)
>
> A QLIST of such tolerances can be populated using a new helper:
> arm_register_cpreg_mig_tolerance() and arm_cpu_match_cpreg_mig_tolerance()
> allows to check whether a tolerance exists for a given kvm index and its
> criterion is matched.
>
> callers for those helpers will be introduced in subsequent patches.
>
> Only registration of migration tolerances related to cpreg index
> mismatch is currently allowed.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

The way that ToleranceOnlySrcTestValue allows the bits outside
the field to be anything whereas the LT and GT types insist
on the bits outside the field being an exact match feels a
bit non-orthogonal, but I see why we do it (otherwise the EQ
check would effectively be a "check all bits match" check
regardless of the field mask; as it happens the only thing
we use it for passes an all-bits-set mask anyway).

I guess we'll see how many of these we accumulate and whether
we want to adjust the kinds of check we do in future.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

