Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp317624lfy;
        Fri, 24 Jul 2020 06:09:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywjVN3WKH85R83QjJ6mouW5Q00wKEWzOB6dhKCLUNUNXOjRUiwLYdz/IDfyF/7y75TRoC4
X-Received: by 2002:a05:620a:7c1:: with SMTP id 1mr10579154qkb.276.1595596190433;
        Fri, 24 Jul 2020 06:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595596190; cv=none;
        d=google.com; s=arc-20160816;
        b=AaZVnZSL7RzF+Wx8PrqmQYhYamEugSp+eszPWjX7AWrdl5cRqZIzDDdU/hUNpjpr5e
         FstcXM4cbmiX6o3SuH5qjEjMIisiKktYdu851pq8H+w2gqf9EvwNajGoS7FVrwKKrQug
         acqx1EwZxgrpGtOfbsEAK5CjuZO4Rb+ee4JHJ7u9PLMgnjFiVSvvdJnmQqcRY1pxalym
         LR7lGkNjfMQgA4NFgrlHLzekxulpULXJfrXRzFVjERF3Yyc4iLfqp9bY7AiIQOVgdi+E
         eSyr4Gba7uxegKSfxpCjtd3rrYiy04qZLQGzCKxer7HKsMGQUa6WrmRbNUkgBOIw2VQs
         +QEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pf32PZHwbkGJ++SA36ZGp4vhRgp3xAk7ye74M190BWQ=;
        b=c3BBLO58jvLT9v9DSteUvf74l0DsIS6AT/qcHnJZLPvWFEY6+lPKbR6mGIocWk/R2u
         41yGQvd2n22MXYVYYJZ5AnBFdKwNyqs8kUCPO5OZXUdWO+KhRxxVwv1IdfI/H5nnnnCx
         EWrJrDyjexWBx4A/gKqgEY3pibH8wUgrgRf/lzRNm9g27GMSrTIkzJ6BITdFZhpNgdDo
         dUF/3u9tXthpk48BTPb1B00JafrwO0oWTwXLqjayo7S/e05AzTh/z0GEpkc3rGel0LUB
         kfCEMBGSjM1sSCAqO1fcYcnCrB3fpMrSJR21FbBUe8VHqhyD9ryLOTlSVfJfMFcCAxNb
         v4Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WJCBE3Rn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b24si476234qtr.337.2020.07.24.06.09.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 06:09:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WJCBE3Rn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jyxSP-0000mb-NK
	for alex.bennee@linaro.org; Fri, 24 Jul 2020 09:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jyxSI-0000mB-Mn
 for qemu-arm@nongnu.org; Fri, 24 Jul 2020 09:09:42 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:44537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jyxSG-0006ud-7c
 for qemu-arm@nongnu.org; Fri, 24 Jul 2020 09:09:42 -0400
Received: by mail-ot1-x343.google.com with SMTP id o72so1345659ota.11
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2020 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pf32PZHwbkGJ++SA36ZGp4vhRgp3xAk7ye74M190BWQ=;
 b=WJCBE3RngW1ZZGm45D6GnogkZORpAeQ0GxIa07hDqu8KgTVpQT7TplcpKMDTiiJ+Yr
 ZpX2HytlcaGxzk/rzseKs6PoZXy6pUoLG5WOC/1zEXoJB0aeAcJTVXvVtVHe9U8j64CS
 OlAd8y+0wTFYzTLH8zISlWXpq1yRgm49X4nzeOua9JIs6qpwqSExz8sN0/Oc+Y8Bx2ID
 o7t+GJ4/HLgp7pEGvprpt02f+6RAqwo4vELB8mA/xKRquNi8zhCQ3vitI70E3+FUKoRU
 8suGPV4ioJ9K9Fz4Y5cFJsYVg6yWy0Roqkz4F3U4FpL5x+JVooztwznve7tBSbR0PRJc
 awRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pf32PZHwbkGJ++SA36ZGp4vhRgp3xAk7ye74M190BWQ=;
 b=po+pJoP1jRy/+n2qtU70BysNP+BFYYCEAjG6zJ/AkFjPf9t0vl98HwqRUMGus86+qW
 YurJ+Fgq45xko1OUFCmwYb3b2rruNxXLiwXo4eiQiHI8tI03TcQxrnAFTowOuZqF4yTv
 a/LgNosDjHnRg6JidWh6l7AL9RxuL0HBbPUysZBnkm6OXpjzxr1djWPq3IKREAbV4p2M
 wBvUXzonuvT9ymkpFz+CDXd776ED5on5YA9aXgpWXr1WCXZhA3eojQ4cvweWM6XFxD2s
 yLlmoJUG/6X2YKf/6QYxVKDyU85CO3JRr96No5ty2TTFCgW50vH9/dR6PzQdKfI4+9Rr
 kEpg==
X-Gm-Message-State: AOAM533a/xrrQZ7KDoOVWIFSYn/Cm11/fw3GAPU1lZ+tE0f0+tBlluBB
 kig0W/YnpQfRhsdLP8/ct6ChUE0GO0Atm1uSNo++1w==
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr8661396ota.91.1595596178472; 
 Fri, 24 Jul 2020 06:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200622113146.33421-1-gengdongjiu@huawei.com>
 <CAFEAcA-NDpWCfqQybu=6svi-ZR=MBBxSKz4dRikDXwW8fftsaA@mail.gmail.com>
 <20200724085448-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200724085448-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jul 2020 14:09:27 +0100
Message-ID: <CAFEAcA_Gk4o5tB27fo93HaxXO1xxk5joZZyHxFBvLFrPhD2qBA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: Assert that we don't run out of the preallocated
 memory
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Linuxarm <linuxarm@huawei.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Zheng Xiang <zhengxiang9@huawei.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W34FxAp8LU6y

On Fri, 24 Jul 2020 at 13:55, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Jul 23, 2020 at 06:50:06PM +0100, Peter Maydell wrote:
> > On Mon, 22 Jun 2020 at 12:30, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> > >
> > > data_length is a constant value, so we use assert instead of
> > > condition check.
> > >
> > > Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> > > ---
> > > 1. Address Peter and Michael's comments to use assert instead of if().
> > > https://lore.kernel.org/qemu-devel/ca79ea28-9ea9-18a5-99ad-25c3eb744721@huawei.com/
> >
> > Oops, looks like we forgot about this patch -- Michael, are you
> > taking it through your tree or should I take it via target-arm ?
> >
> > thanks
> > -- PMM
>
> Feel free to merge pls.
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
