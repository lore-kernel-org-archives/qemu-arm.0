Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11233F44846
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 11:59:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wBAWb-0004V1-0B; Fri, 10 Apr 2026 07:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wBAWZ-0004US-AG
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 07:59:47 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wBAWX-0004Bm-UW
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 07:59:47 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-64edf260b49so2978371d50.0
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 04:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775822384; cv=none;
 d=google.com; s=arc-20240605;
 b=OyveWqJ6WQob19W+rZANP2xTxjGLoKGjhyqBWFv9rzpY2EQD2CXMH5/1ffab3JQmYa
 axEDCPkdmKhWGH1wkPrddetppP3Bc9ga27JNVazSYG8/jD/1Q+CbT88WfThWqBzL9FRw
 bSKMfPDCl5D3MhQ9VNk4jlg3EJlrF6Jdle137XuUQblRAj60zWmKLEnU5ByZGQiWpwEw
 DGb182h53fCuu2MI+JAJsP147Y+ys60dmtdmmERAXwIsCuBLgTOpM/lI4d/qxonqgiuF
 5NImbgIRKrvGB6n30h8D258slUnHcnbXQx5Xwfl04NokvIH9cwYN7/b6PgHM+4bCQIFD
 k5qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=3D40mIBQsPhv5w8N5dbt3L4osa2H/vn6qkOsV7LlUcw=;
 fh=bksjQORJBCEfw0SHKa1nKgVuWJZubyxYASalQkCn4n8=;
 b=DiG3Cb5/tWsWovNkteCe26orRy6dDld4KA8eZKxq7hT28ODUT+pCYZdgXKPf7n9j4i
 7P29gnBCz18fPq44+nKhRygB6XONCmoBbLuOYnm84Ec4ScEZareoVenQqmER3vxA463B
 zj3xyxEE/oLGhn7hxwmdD79Ky808/7+tYUV9KpMSW8GaNj1cKwZcit2xn/oeTUWFf61Y
 ukuDvYetB0Kh1D1Aqxj6gsbcsVr/0UECLP0U7/Di5QuktMhq+oJnyXKkc/jyw3ELdHPh
 wcUxk4wqoBs/5mVOXytJeQXczfnh1U+PbeQq1j/lUDSY75t6va5suLSm/1LCgZCQoVqr
 RHsA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775822384; x=1776427184; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3D40mIBQsPhv5w8N5dbt3L4osa2H/vn6qkOsV7LlUcw=;
 b=uL/ZGSwj3aXScLtfnZYsxom+5KzMiNkNVQik3o9ZGsxDdOnbxwaaOiZsvGzkO3OkVq
 A5bUi3FI4Hm8UQ1SZKhuPcZIlgQAqUs77FkP9W8Z4IU5EHpCBtpfv1sK5QD/wHCdcMdp
 b4BpDSYLcsUuIOECxO/T19nuMghtTyLrHPcZ162/furazzRqGByoQKjGaOCS5Y8CxIaS
 blOQDK7rFaUZIz2PJ11Pp8Rusvhnx7p6nKK0GDQse8rvouaDV/s9gOR6SkP7nA3SLUjR
 o28U7uVnV/jpaCy9v8l1RBJb9sCsK3fdZhLRrFCNB1l9fPiGiGiNwUkp/qAXAabXA8Mw
 7KHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775822384; x=1776427184;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3D40mIBQsPhv5w8N5dbt3L4osa2H/vn6qkOsV7LlUcw=;
 b=lMxRxcoIIn73htEIVxjzZVkOfZSTPMUnqKwo9IpHYaT5Cp7Rv09oczaO5lkmdqNgA6
 Ot5P+lS9nyEhYHBvdIT2Ct7y/LyY5y0UjdsBFrmYjWWCAw/v1cfCplUjCM5Rc8zFL0ss
 nVLW6sjwQLHZXi5/T+PrLbZo1hgyqTK5BiQXvy/vncB9Dqli4MevzgXR/pdGnH5jR6QX
 BOEat7H1x8UUuj+bRMDa4iXLlJV2UqN1pYVL7bwaL7DR0/ge7Nz9lU3CxgAtUhnFWDVU
 Ka5xgSUmCMzYy+ouo6/Yc/Y+W4FaM3vfZ4BW3ACn10vlEob/6B3b4i/f+dTdn9FpAKCy
 oEzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5BGt5fHs9ZyThy5aK3FvOyZQKplRm5UbjdDluEmtYPakbBTYBIbg3lrOR2yLDA5t1axZ+SiBYdA==@nongnu.org
X-Gm-Message-State: AOJu0Yzgy5/1WLchANMNcpfX6nJJLQEtNUKmcwKJAkNIgJez7ibhBDXU
 SZOFxV2NjjSVPqAdjfxbQb3EVeIBJgCLS3RSl2dmcI5wENEh2QTNNy60yhRbyTwaG/aYe9niLZT
 gozSfRGDJP2ir+aIqUyCnO7VDyQ45QIltGNC11r8+DQ==
X-Gm-Gg: AeBDieuqRxyTM8eT1FAKEbQGcAGT2KHentoK1T23/WQKHwGBRpwj3wS+Yu+SunVeAoV
 1asHx1h1Y+ce6oxcl1SJX7e9HYUs4qV+TA7s7lZUyp+0UctcbTAYQueZ0LR1F5bvFRrOjJPIug7
 gutXpGDrA4VIV1nUM6rZIeRxL42p/TU457j4dVUIFMznbX/yHgypFbURRFcon2mi2F4GdsDjY1C
 AfKU/DQYyrxNK7bz9yVyCrEg/1ugEywIZMkjmXqGPHZ8tpIKOSU5x4cGWvuuD7P6go9hTl0mjl6
 h7qoJ0E+1cTxlXiCxw9mZW5lcxH8preUzq2EN4lNK5maBafneGcPFbIc2N9tE/9uCeC5kBgxSH/
 ktw==
X-Received: by 2002:a05:690e:c4f:b0:651:878b:d819 with SMTP id
 956f58d0204a3-65199058a4emr1998205d50.17.1775822384027; Fri, 10 Apr 2026
 04:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260306150302.203112-1-eric.auger@redhat.com>
 <20260306150302.203112-7-eric.auger@redhat.com>
In-Reply-To: <20260306150302.203112-7-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Apr 2026 12:59:31 +0100
X-Gm-Features: AQROBzCGRD1e_255lIV7RPpsBrErU3yJsmgWz6BLzMstGlZ2JBe-TbfABlhrWnI
Message-ID: <CAFEAcA8WjE7gJOKJULcBKAu=hbmu3rx_7sj3br4n7xhxeFSatA@mail.gmail.com>
Subject: Re: [PATCH v9 6/6] Revert "target/arm: Reinstate bogus AArch32
 DBGDTRTX register for migration compat"
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Fri, 6 Mar 2026 at 15:03, Eric Auger <eric.auger@redhat.com> wrote:
>
> This reverts commit 4f2b82f60431 ("target/arm: Reinstate bogus AArch32
> DBGDTRTX register for migration compat). We don't need that commit
> anymore as the AArch32 DBGDTRTX register is declared to
> be safe to ignore in the incoming migration stream.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

