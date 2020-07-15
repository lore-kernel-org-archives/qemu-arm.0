Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp480044lfm;
        Wed, 15 Jul 2020 05:27:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsXqGAytCkj32sDVT82Z0LWanPzkuTZ0x6fMLFmdaGH9Zs5Nu4vvOZ/LaTzpx496deV4od
X-Received: by 2002:a25:c60c:: with SMTP id k12mr15573064ybf.407.1594816034936;
        Wed, 15 Jul 2020 05:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594816034; cv=none;
        d=google.com; s=arc-20160816;
        b=ISRDh/E1IALLttTUfohLmB4g6Mgwoa1Tkw2gGeTpm/9Phd10ND+KjMDaFDf4Anmgmz
         w8WzhzHN/zyvTmBBbIvZ5DZteme3cNV2set2Lim2FWR0N2X0FSjo24B4XgsiHRA7JpXD
         GiW5TE5aVhxiJPSmD6O72cWWvzC6A5lMFYi1W3UGBevk26a5NDsN+Mg4QOm3YGmfbKSB
         AstBsSlrtadBZbB/NH+4e/WIbKhHW3FL54blA2II6S5XZEoPEC0+wYzSOhKAdUdZ1Q9d
         +jX3EPgS/DVIiXufpsOWecYwiZol130wxgnMx6/pbpHncEwdUnx0ugc3Vx+SDptxQhek
         jZfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MI3ApuPmV+XnwADtK+8OS+Kl4ftWFCRfk0d8a15DsVw=;
        b=AeoaATaqgSiypFLUOfBr6RxEW9eKGdr2QedezaKMvaSXYD1pxZH+kNqo3qm7U0vKAW
         bSCi2nFWdYTUYQGxu1i85elbd93Jn0lUnFWaAvY4rkVTLTGsWXdjEIYt4VD6soIn2ngP
         StmohI2PMjbcbiwuLu4+t02+2swNL7Iqj5QThqIgOjRMAAhqZNocUM8Vdw3fDoNzLni4
         a7fGeV4tZ1IaVWfsUk4Zf1hk1WoBbFAbEU4n5cRks4zyowb6WKo6j8YJ4NuHYB9KxHT7
         mdCbPF+4Cuzcxu/fibGkBI6VbnkefKJpQsfxQyKTq5ta0riSh3h7vDZCABf1GiMh3j1e
         CbVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RxcFhRdz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si2597349ybc.311.2020.07.15.05.27.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 05:27:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RxcFhRdz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvgVG-0001T3-Al
	for alex.bennee@linaro.org; Wed, 15 Jul 2020 08:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1jvgV8-0001SD-20
 for qemu-arm@nongnu.org; Wed, 15 Jul 2020 08:27:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23434
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1jvgV5-000360-HZ
 for qemu-arm@nongnu.org; Wed, 15 Jul 2020 08:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594816022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MI3ApuPmV+XnwADtK+8OS+Kl4ftWFCRfk0d8a15DsVw=;
 b=RxcFhRdzSGxfvbXG0LybWW8egplGAe8L+oedVEMMCen3uNNn0v06QMa3ap/rmhgfGkkeHS
 PfGUV4j4BjlXGJj0IkckDgJm15/ezYx119f21PLrBraeOJ5gU3XhK+9uib9qlWaih3mHGE
 GI/I5MtUlbwlwwTtfnzOMyVEa10HmUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-twX49xd-PrGHN5IKo_0uuA-1; Wed, 15 Jul 2020 08:26:29 -0400
X-MC-Unique: twX49xd-PrGHN5IKo_0uuA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D46B8027EC;
 Wed, 15 Jul 2020 12:26:28 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-3.ams2.redhat.com
 [10.36.114.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAAD972E7A;
 Wed, 15 Jul 2020 12:26:20 +0000 (UTC)
Subject: Re: [PATCH 3/4] hw/arm/virt-acpi-build: Only expose flash on older
 machine types
To: Andrew Jones <drjones@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20200629140938.17566-1-drjones@redhat.com>
 <20200629140938.17566-4-drjones@redhat.com>
 <20200713104907.335bf762@redhat.com>
 <20200714055109.owrlob6m53notzh3@kamzik.brq.redhat.com>
 <20200714045537-mutt-send-email-mst@kernel.org>
 <20200714092325.5klaeqelu46mhg76@kamzik.brq.redhat.com>
 <20200714164141.1ce6b122@redhat.com>
 <20200715063648.rigcdnaxveened6u@kamzik.brq.redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <b1593635-54aa-fd8c-951d-c2ef648ec6c9@redhat.com>
Date: Wed, 15 Jul 2020 14:26:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200715063648.rigcdnaxveened6u@kamzik.brq.redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=lersek@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 02:37:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, ard.biesheuvel@arm.com,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, eric.auger@redhat.com,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fE9m5o3xCOjn

Hi Drew,

On 07/15/20 08:36, Andrew Jones wrote:

> So it sounds to me like we have some flexibility in our versioned machine
> maintenance. We can choose to forgo the usual compat code when the risk is
> deemed low enough. And, if somebody screams, we can always fix it later.
> I can live with that. I'll go ahead and respin without the versioning.

In that case, please don't simply remove the acpi_dsdt_add_flash() call
from build_dsdt(), because then "git blame" won't be able to help later.
Can you please replace the call with a comment instead, similar to the
RTC comment from commit 67736a25f865 ("ARM: virt: Don't generate RTC
ACPI device when using UEFI", 2016-01-15)?

Thanks!
Laszlo

