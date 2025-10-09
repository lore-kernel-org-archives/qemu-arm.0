Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8DECCD184
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Oct 2025 15:20:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6sQv-0004V6-MF; Thu, 09 Oct 2025 11:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v6sQi-0004Kg-Hw
 for qemu-arm@nongnu.org; Thu, 09 Oct 2025 11:19:46 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v6sQZ-0001NH-K4
 for qemu-arm@nongnu.org; Thu, 09 Oct 2025 11:19:43 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-635283199a9so1102308d50.1
 for <qemu-arm@nongnu.org>; Thu, 09 Oct 2025 08:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760023173; x=1760627973; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GZg4AF6rIh+C8il8WtkM5K9qNXhZ3A87/kzIWgW9rok=;
 b=zPXJSfHKfy+yycbzV0ymS1gWX292AiwjnszfuTaKS1YX6OFBnKxDPFicMmzfQ1wGwA
 vutzm2liKfinRY1nLLd0PmO0QMqTVaARJBktQv3Z/x41RrI5UCgcKV+Db+gjGC2wDdNf
 UuA0hireUEoDW0gojYYz91UHhAwXoXwqiPtyyiQz5wlMY+cHD2lyKIkLmFEABsfBOYm+
 D4eGa6ajF1wXOOOqOjDb7EWebvH0fFCNrd10JA5tZ/voy8zpPHmt3itoCyi1NOLytEvQ
 E27Qx1KuXYXXv4H09woyadf/Rghjt4tc3OCIGCv6PrSqqzUI64mC73P5YxN7IsIK4DBN
 hLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760023173; x=1760627973;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GZg4AF6rIh+C8il8WtkM5K9qNXhZ3A87/kzIWgW9rok=;
 b=F1Ou1d+Mbi55Fi543TOuFnUw0t0Ranw2aUvLL1ArkdOe+JRVsiVI9M2SPa9t8tOzH6
 BMUegFAXoumCXqIesaATPwwXb6e9n6rz0BD60xDKxftV4oY+ysitZIhiux2tAWeXY/so
 YFNQYE7ewTISQ9iEyfq2rC4ziJsLUB7DeBdvls0a+K1GU74VEGleEeaABZ/bUT4kKXJa
 5nb3FVLcaKMIkzPQK0ivPY13uw3iSrwVgD7F2qee6u8bH7hsPaCDviIexxbA+uDJX9iE
 VStqnLBRLmt2WHGjXSQRfBPRyBCXIKpR8iGjyHsbRzD+h2CqoqnzrDeBwcy9ufLMMDRp
 QBjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0+RcM+dRfo2z3a0iM06umsnP3sVFV7G/N4NjnibnZHWTCVw6kt8e+3zoSJ7ZrkWIW+02JZdXOGQ==@nongnu.org
X-Gm-Message-State: AOJu0YzV44oXgUxh7kIEf7MaOZPMWYcGMCh3y8ULufUBAjZ1Qzj+otXG
 ougSibbPiqYI1ki8EMWi0MR1uumV7Z11k18bNy37bE5VresiRceTYNFPC+7AaAOXPKzw9hp8QaU
 b8ANiv6S+F4cd5nAPnzrMOKOWAEsdwsPAzJgx07y7qg==
X-Gm-Gg: ASbGncujaCnEeTw4LRDrKXnHbf7RjGAWhplYpst9CF4T4+dAS19qyqU8CANpZW4GEKr
 X3iUEL2X57lFPZCECY3Y3jqZP26lzEdvKR8x40JXBbR/8a4UwDO60Jw1UvThMooWWw5fGECe5/U
 Xd6okUlFJ5mmSGcX0TuffiKHPiF2hklmPmtKdkgxty6b/gSJCZJ28HkBxyQNz+HcIDpuWFBSsYT
 vKZn+AYekg8nDsaAVyjwluyzI5AYlbbl3JO7ZA50VgaI3k=
X-Google-Smtp-Source: AGHT+IGmS7nTo+O/VdN+IQZ4G/SUWtNQDcbSp9xh4nxNSxQXQ8oOmNXga3efTJZqLYpk1plKAdOk1eQafehtsqf9KSI=
X-Received: by 2002:a53:c9c6:0:b0:636:1fd9:d64b with SMTP id
 956f58d0204a3-63ccb825212mr5677209d50.2.1760023172847; Thu, 09 Oct 2025
 08:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251001010127.3092631-1-salil.mehta@opnsrc.net>
 <20251001010127.3092631-23-salil.mehta@opnsrc.net>
 <87plawh2sz.fsf@pond.sub.org>
 <20251009145125.6583a24a@fedora> <87wm54nmyt.fsf@pond.sub.org>
In-Reply-To: <87wm54nmyt.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Oct 2025 16:19:21 +0100
X-Gm-Features: AS18NWBQyNfXQcnxi4vPQTObzUW2InZV_ETHl2QjL9ahSGJnOXebjCpJ1lpn8BQ
Message-ID: <CAFEAcA9wa2_c5YYwYJRL-aZThujxYPt1mg3zy_YEBaQ_8cX3Xw@mail.gmail.com>
Subject: Re: [PATCH RFC V6 22/24] monitor,qdev: Introduce 'device_set' to
 change admin state of existing devices
To: Markus Armbruster <armbru@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, salil.mehta@opnsrc.net,
 qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, mst@redhat.com, salil.mehta@huawei.com, maz@kernel.org, 
 jean-philippe@linaro.org, jonathan.cameron@huawei.com, lpieralisi@kernel.org, 
 richard.henderson@linaro.org, andrew.jones@linux.dev, david@redhat.com, 
 philmd@linaro.org, eric.auger@redhat.com, will@kernel.org, ardb@kernel.org, 
 oliver.upton@linux.dev, pbonzini@redhat.com, gshan@redhat.com, 
 rafael@kernel.org, borntraeger@linux.ibm.com, alex.bennee@linaro.org, 
 gustavo.romero@linaro.org, npiggin@gmail.com, harshpb@linux.ibm.com, 
 linux@armlinux.org.uk, darren@os.amperecomputing.com, 
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com, 
 gankulkarni@os.amperecomputing.com, karl.heubaum@oracle.com, 
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, 
 wangyanan55@huawei.com, wangzhou1@hisilicon.com, linuxarm@huawei.com, 
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn, 
 shahuang@redhat.com, zhao1.liu@intel.com, devel@lists.libvirt.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Thu, 9 Oct 2025 at 15:56, Markus Armbruster <armbru@redhat.com> wrote:
> qdev introspection (device-list-properties) is like QOM type
> introspection.  I'm not sure why it exists.

It exists because it is the older of the two interfaces:
device-list-properties was added in 2012, whereas
qom-list-properties was only added in 2018.

device-list-properties also does some device-specific
sanitization that may or may not be helpful: it won't
let you try it on an abstract base class, for instance,
and it won't list "legacy-" properties.

One problem you don't mention with QOM introspection is
that we have no marking for whether properties are intended
to be user-facing knobs, configurable things to be set
by other parts of QEMU, or purely details of the implementation.

thanks
-- PMM

