Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp509990lfm;
        Wed, 15 Jul 2020 06:05:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx892T1Rlm5tX5fi+ZbdAhpqC2xiwKhnH+7uTIs0XqgCLD7idTTVOWabYHXADisjblSRGmM
X-Received: by 2002:a25:bb07:: with SMTP id z7mr15128789ybg.343.1594818358861;
        Wed, 15 Jul 2020 06:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594818358; cv=none;
        d=google.com; s=arc-20160816;
        b=Mx3onnQze5jfAsArCWKfXslFbfy2UJKgFBa3KTLwE/g0XQ2TEqy0zaLaRhkOizY9ko
         S5CYVUqlOBrH/QwZdBl8zLJLsoNWLODMIrr8bZ+562QZuinFoq+Af6uy3H8zHYQeZk/+
         mP/1SPLROZ3+nkNhgVjS0UmdTv6Sz8BxS7VEWg77JDTC3h2Q2S1GgNnzpB0GYrwknFVm
         DyNO2M1+ydW7cDI/liN5j0keEOtTOjP/tmqQhxFL15bNPsZDk1H6LsBnUt+LCf+wkwnV
         sZihtcJSR3ofq47lxAiiNPgtP5LF9UMmhJyo/u9nJvSRxjyxO/W1/F3JB9chubHBjIiB
         9kZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=mwDRxRl+3IUgJSVH3++6rWrApTzCoDqL0Oof74/RdKo=;
        b=keWSIY14lK/FoQHPACnuw4/5XELhC9TKNfd7y+ctK/bYu0DgQ2TLrPcGP+zIyhveT9
         6NK8xg8oIpmqW25xq3KP1avrxzmi6hI5ETthSuQnpIu9urPLTKk3KcZdTlSw0Oi/MDRx
         65mbomPwBxGrFG607Xior5x5v7fAGehMf8y354qpOaXyl69B8+aFbAwt4/ufMOVv2Mpr
         7EPvT3rZBerykSu8N33za1nVeyLp+YpnDinURqHKQ2tKJmY1D2aF3bZrMoHd59rxHNUb
         +Uq1hitFGBdD0rSdiIbqozCp6Gi7U/3M5rzEtWWfm0jpDRL/8OuCyndAPaJ1x980GkFu
         twFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WoWP4h1S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si2497187ybm.286.2020.07.15.06.05.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 06:05:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WoWP4h1S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvh6k-0003eL-80
	for alex.bennee@linaro.org; Wed, 15 Jul 2020 09:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jvh6c-0003bt-Hy
 for qemu-arm@nongnu.org; Wed, 15 Jul 2020 09:05:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54731
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jvh6b-000442-0B
 for qemu-arm@nongnu.org; Wed, 15 Jul 2020 09:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594818348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mwDRxRl+3IUgJSVH3++6rWrApTzCoDqL0Oof74/RdKo=;
 b=WoWP4h1SWNron8dCg77rogAmHBxwgQLCWZO8REV5t0XN1yZXhaLLiyLOYz+wXA7hLzqcXA
 W/4UPJ9DyZ1e8Q7nzuTA4iNdFmsn/LwV8ZD6wKgKWSaOWlyE3XVGmuEAqV1fjdtr2qBeg6
 Jr++gttd2rySG+O6avLb9xU70i7uWO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-X_kl0fCHPGCIgJaURL_ZtA-1; Wed, 15 Jul 2020 09:05:44 -0400
X-MC-Unique: X_kl0fCHPGCIgJaURL_ZtA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AF2E107BEF5;
 Wed, 15 Jul 2020 13:05:43 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB75E78A50;
 Wed, 15 Jul 2020 13:05:33 +0000 (UTC)
Date: Wed, 15 Jul 2020 15:05:30 +0200
From: Andrew Jones <drjones@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH 3/4] hw/arm/virt-acpi-build: Only expose flash on older
 machine types
Message-ID: <20200715130530.gtgjyvxfol35i6lk@kamzik.brq.redhat.com>
References: <20200629140938.17566-1-drjones@redhat.com>
 <20200629140938.17566-4-drjones@redhat.com>
 <20200713104907.335bf762@redhat.com>
 <20200714055109.owrlob6m53notzh3@kamzik.brq.redhat.com>
 <20200714045537-mutt-send-email-mst@kernel.org>
 <20200714092325.5klaeqelu46mhg76@kamzik.brq.redhat.com>
 <20200714164141.1ce6b122@redhat.com>
 <20200715063648.rigcdnaxveened6u@kamzik.brq.redhat.com>
 <b1593635-54aa-fd8c-951d-c2ef648ec6c9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b1593635-54aa-fd8c-951d-c2ef648ec6c9@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 02:37:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, ard.biesheuvel@arm.com,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, eric.auger@redhat.com,
 Igor Mammedov <imammedo@redhat.com>, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NICqOuKEc/0f

On Wed, Jul 15, 2020 at 02:26:19PM +0200, Laszlo Ersek wrote:
> Hi Drew,
> 
> On 07/15/20 08:36, Andrew Jones wrote:
> 
> > So it sounds to me like we have some flexibility in our versioned machine
> > maintenance. We can choose to forgo the usual compat code when the risk is
> > deemed low enough. And, if somebody screams, we can always fix it later.
> > I can live with that. I'll go ahead and respin without the versioning.
> 
> In that case, please don't simply remove the acpi_dsdt_add_flash() call
> from build_dsdt(), because then "git blame" won't be able to help later.
> Can you please replace the call with a comment instead, similar to the
> RTC comment from commit 67736a25f865 ("ARM: virt: Don't generate RTC
> ACPI device when using UEFI", 2016-01-15)?
>

In the end I won't be respinning, as this patch is already merged. And,
unless Igor twists my arm, then I don't plan to write another patch
that removes the compat code. If I did remove it, I'd put a comment
in there for git-blame to find. And, in the comment I'd write "Igor
said to remove this", because git-blame would otherwise blame me :-)

Thanks,
drew

