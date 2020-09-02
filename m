Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp309401lfc;
        Wed, 2 Sep 2020 00:42:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXS/C6tpqNcUApUy/nmVUSqffxA5zWQjR73GnapFLTnCd/6rWMQjiUxgSb4FbYtb2uAoX+
X-Received: by 2002:a25:c74a:: with SMTP id w71mr9453197ybe.191.1599032564408;
        Wed, 02 Sep 2020 00:42:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599032564; cv=none;
        d=google.com; s=arc-20160816;
        b=eY5WOjWD5/cxk387ss8l1uzcROcBZPiH0jSF5J4k7uK4+0FQF6AQtQC6wxhbCml7wZ
         Nfuw91q0xDvJRquBeN08uHBHEm7rKAGbVAs5qcxsnceO8TpNap50SkLHYzCc56LvXB3R
         nFbbH5w6M2v3VBWM8vzmKrf+3nVxe3nQtvN5Ho84nLDT8xyFM61t8MUJHz8f3AmTbi99
         7BR9/wrNiWXuT/qGOXlEgK6RjGsO1fYD/5US2KjHty56T8Ol6W2yp4fWm5fw0d1zGVpQ
         FxZxKfbXIm1SjzyejTVFB6Nsu6k2MSpImAZb9anx3Ng7pH9vHBRxhMRruuGjH42Ktlhs
         wy+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=5TSL9Hp3xkvgqJ0TyhB+yjnzARfaZLYrgdm5uOO8Vu8=;
        b=GmeKLIAHVxoRH8Ubo9Xv3osS0+ULSvhzI3Xtmmhgsdk4c245f/lPYwgy52ocekpmYm
         8Y5W4xtg8ohzuqSxTtMP7aJz+lWMz5ybO6Sp3VswHAxPKSzL9tC0zbi/DZ9n8wLEF3XY
         8nBvtWccylQyt7dpX6lG25lJwfuCU+2ILjbg3RTL7Te6WVJLVMMiMgt2znznXVfRcgFD
         dZv+FMHQSaeg+yPRSBrJQD0OddoREafO3dQwBQDvJOhvzypNNVTztNOTIUtX5j6zCWRz
         X+VGibkDAO4G2xIVaW9q+85tiK+tQmgWFRh2La3+gaOX78oB5DbEgiw+E3iMn7ViZVF4
         GOaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="KEL/2nnD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14si4564092ybk.483.2020.09.02.00.42.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 00:42:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="KEL/2nnD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDNPn-0005Wa-Qt
	for alex.bennee@linaro.org; Wed, 02 Sep 2020 03:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kDNPf-0005Vx-W8
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 03:42:36 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41592
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kDNPd-0006uM-Qq
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 03:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599032551;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5TSL9Hp3xkvgqJ0TyhB+yjnzARfaZLYrgdm5uOO8Vu8=;
 b=KEL/2nnD0TLF8xca3B1uFjwFzAPcSLT2Gga3XUKd9ZwupM23LtrOGB13/d8Puwp0OFxcqs
 +DzEGhI2tuLACcYy2KS+IxU97K5F2x+8gz3cVLOa+QIBjgEcNkrj1yhY9SW2c/rsfaJVhd
 2xmg2gwcsJpL/EM3GH68f1ZYwsZEkIE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-I2w0IAFJO_OdMNTPbHPVWw-1; Wed, 02 Sep 2020 03:42:30 -0400
X-MC-Unique: I2w0IAFJO_OdMNTPbHPVWw-1
Received: by mail-wr1-f69.google.com with SMTP id a12so1614427wrg.13
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2020 00:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5TSL9Hp3xkvgqJ0TyhB+yjnzARfaZLYrgdm5uOO8Vu8=;
 b=D2hex/KTJ9ocgFYyFHSv4dz9dVp9NGIxdocASo+1/tmH65w7HKPeFObkapX08oDgNz
 LqjF85EwScOgJj6yk9G5FjCQUC/O5kOtyMSqZBCj3sADEm3OXnuMgDECZ8ecXCiDNx5r
 SD1Bpy4qpURxn+vQv0169fEB8DoEymIfti0f2Rd64PgtSfNKGHrcr4DWPx+HaEufGXnf
 o21XtkSLfZxnUQn/aaM58Aydi+l7VWNGU9Gp9k/LHtslYcDM1vuc2lEv7A9mvOI2R022
 vjksUcGrcGMZa1L8kFEo9VC4zZdxO1m8OrgVPaCS3PUcrjwZp/YhFG+Dof7+mZQrIhUM
 Fp6Q==
X-Gm-Message-State: AOAM5305AYwXwR9SfRwcu3Y2SeimyHbN8GM13ym3tb2h6OFxDCUgC0l0
 RKPXV2XF0S9mDAyNDtGW0Wb+P1BYO/BO/i9C0VjeNV9eCayQHIHhW+i+BnBhHocgDSsOoyF+X8z
 lWuWFCAlasM0M
X-Received: by 2002:adf:eb05:: with SMTP id s5mr6386494wrn.0.1599032549277;
 Wed, 02 Sep 2020 00:42:29 -0700 (PDT)
X-Received: by 2002:adf:eb05:: with SMTP id s5mr6386460wrn.0.1599032549043;
 Wed, 02 Sep 2020 00:42:29 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id n124sm5165012wmn.29.2020.09.02.00.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 00:42:27 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Subject: Re: [RFC v8 1/5] memory: Rename memory_region_notify_one to
 memory_region_notify_iommu_one
In-Reply-To: <20200901142608.24481-2-eperezma@redhat.com> ("Eugenio
 =?utf-8?Q?P=C3=A9rez=22's?=
 message of "Tue, 1 Sep 2020 16:26:04 +0200")
References: <20200901142608.24481-1-eperezma@redhat.com>
 <20200901142608.24481-2-eperezma@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Wed, 02 Sep 2020 09:42:26 +0200
Message-ID: <87eenkr5el.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 03:24:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vGYRmloFqVYS

Eugenio P=C3=A9rez <eperezma@redhat.com> wrote:
> Previous name didn't reflect the iommu operation.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

