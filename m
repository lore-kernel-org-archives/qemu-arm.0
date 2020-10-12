Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp909048lfa;
        Mon, 12 Oct 2020 03:14:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEdMdd9RNB/LsEbrvOXDlwx8JGwM3qJ3anW7V/Ci2Wx06vsiaJrBQ/i9VQdiozy7UfF/H+
X-Received: by 2002:a25:1c41:: with SMTP id c62mr33397385ybc.60.1602497699731;
        Mon, 12 Oct 2020 03:14:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602497699; cv=none;
        d=google.com; s=arc-20160816;
        b=E+jC0VcdZ4N6+jXokrhZjzV06+C/IbKirqdQhKyersdXKCc24qZEcop54us/FhN5Lp
         id64guRtP178XzxL3ZJGCBJL9sUeot1BBCdY2N5lwazkzd5LiCk7TyHQoEeHrKNYGcWB
         tNzJ/PobdKbk2hwzXECNxMyJCGW/EOs65Ls3pOHyukJEQEZz8eABglfnmyPyvzz8euHe
         ZE1X/S7Nq4J2bfkcExv8gGUxUf8GvZ84arY9n46dC7orfYRMvltTGDrMGFHfLxixx49d
         2YTLxNxg1+SsMZ75zHf+brCGsCX0d5lcCXK1l28P1s6+0+a+zthINiGNMXzL6ZPIrch1
         Mrcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=26bYJ3kV9qOG6sJymY48BBmaYoGlXnd4Mlrzdww9JZo=;
        b=RyCU4qO7RM5O5TxEITIt9icecsDZ/B6qP4o07TgGWm+r/cg+kKlc1MypwrBFG3DMBl
         iIu/NEyf/vnl0ENEe9YQ/boe7WjQuY4uy1V4ZAa1kUc/cRqJPaVR/sdmwe8VBrAmRzQL
         0PSgSBZKfMV4hgw2167vRkotCmvFrafZCH5tTTNqGhe6wQK118Q5uRi6S2XYQC95gyz0
         GxMSWFU/blD8zD1v3TLth85n25v1QnOKLbADwFveul0S/Nvt+WlIDU1w2LkWtbuk5exU
         f0smS98yK8L1bTprZS7rYTJl2m9hXlP3Z0X+oZMzEbMGbTytmFdPBk3txbLTyAxoVWiJ
         0IEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZV0Gpd1D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r124si8168602ybr.411.2020.10.12.03.14.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 03:14:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZV0Gpd1D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRur5-0004UJ-3D
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 06:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kRuhN-0007lr-JJ
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 06:04:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kRuhK-0003Tc-Qf
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 06:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602497093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=26bYJ3kV9qOG6sJymY48BBmaYoGlXnd4Mlrzdww9JZo=;
 b=ZV0Gpd1DrZRShImC9H6oOAsRRBSWS0OYU1AQCWxPvX9oGt9M55y3kQwmf2HUO3Xm/s/Lrb
 /IqBdPHWzACCEhZzJ3H6mBTihUNl4EPZl1ShaLWQwVWnwIVAL7FL3QqUol17jshIVTZH0v
 9e2RwC8rPaDmPBP9AmaoGC2owPPAov8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-rNjWWOEBPnKoQzfTLLzoeg-1; Mon, 12 Oct 2020 06:04:51 -0400
X-MC-Unique: rNjWWOEBPnKoQzfTLLzoeg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72A151018F60;
 Mon, 12 Oct 2020 10:04:49 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-24.ams2.redhat.com [10.36.114.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E71576666;
 Mon, 12 Oct 2020 10:04:45 +0000 (UTC)
Date: Mon, 12 Oct 2020 12:04:44 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/3] hw/ssi/aspeed_smc: Rename max_slaves as max_devices
Message-ID: <20201012100444.GB7777@merkur.fritz.box>
References: <20201011210513.3253905-1-f4bug@amsat.org>
 <20201011210513.3253905-2-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20201011210513.3253905-2-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 02:58:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4lY2Y4kxLCyh

Am 11.10.2020 um 23:05 hat Philippe Mathieu-Daudé geschrieben:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> In order to use inclusive terminology, rename max_slaves
> as max_peripherals.

This is inconsistent with the subject line which talks about
"max_devices".

Kevin

