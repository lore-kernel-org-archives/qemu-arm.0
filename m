Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp316877lfc;
        Wed, 2 Sep 2020 00:56:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0Ruu2M9YAhh1f76KqYLLbMyWmvusKdWjoslDo2MHfjsIueXV3Kx4pDDxC2wwb1OLz2atZ
X-Received: by 2002:a25:c345:: with SMTP id t66mr8537473ybf.218.1599033363756;
        Wed, 02 Sep 2020 00:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599033363; cv=none;
        d=google.com; s=arc-20160816;
        b=b82DysLx58w+IYcrMPwVaN6jZzDhrHnGvrDoixkcgH7Fpsh6pGkhRHKnlMd3U6gt8w
         wUeXilUGCd1ECoZ7PWGG4v+k5To3ahcprdxQvpf8ovm2spcrbTKBz2XlprVV6kFn73VF
         KUdLhXuumyC4bSfFKmrr9bbvt+oRHotZ7rhJW+QJqH/7q90bFHXqa8/nWsUpC/Akm5Wu
         lhUPW+dEGHCCWGiMJiu+SupqnaFYuiucpBQoidD2HmhUzZi5Xj629lAkl/mQjsIP/mgp
         kHf7zCBMS76Ykrak3fo+Roa5QlzLX9CYlBP0HyaN+j1j8/kIhFRSqSjfDYcfEEMopZbY
         6Shg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=WeCAJkUb+h6KimGOZfxLjvhINNCPL15NrlPSw5Ccpc0=;
        b=YnWCq8YGMmYH5q/XQ4QcpcAzWfp3pTflYTz83Nt5y8/JzhnYFwoN3WU3EQZoa7IVXM
         k7vCr9m+4Kc/cU1nKEuAA1++/L0DIpWKkLElEOYHjSTwGdKIPnRB8+0xaRf5j5Du8JJt
         H7tV6/nKN5GfcxXirFSC0twaJhR2ugxu5IWJvcco20v8zerOXwZbQTFzYB+43zT7Y7OQ
         0M0p1hJf8e4UQR9Nm5oF23RK4JUOvtov9d3XBbMl01px22Nkbxc84nLzSwPDZSRZ6Hhu
         zkVqWVNDdiGmSmpN6Qav1/DB15/lUc5shw/QOwtTzonf0hZA/wDFghRK80214Z6MDeeT
         TOKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XZXW1EKr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si3292901ybc.167.2020.09.02.00.56.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 00:56:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XZXW1EKr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDNch-000644-1K
	for alex.bennee@linaro.org; Wed, 02 Sep 2020 03:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kDNbq-00054c-8I
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 03:55:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39213
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kDNbo-0008Kw-M5
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 03:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599033307;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WeCAJkUb+h6KimGOZfxLjvhINNCPL15NrlPSw5Ccpc0=;
 b=XZXW1EKrt/WwsnMUcXmuHqK8UGjtFnPImITeLy9oJoZJIDIeY2QrqFez4oVcWHJQmUPRvA
 8cdXpzi76eShPZsYpVYPyU9z+XIItDhvE5Voz9lCnLpq3VxZJpga0B3I/1P5CDNHCuYUEY
 rk1jaXOJHWJdFdLtp5Y4NAjOL8ALtWk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-phCkt6zpPwG8U7JBZjpaOg-1; Wed, 02 Sep 2020 03:55:06 -0400
X-MC-Unique: phCkt6zpPwG8U7JBZjpaOg-1
Received: by mail-wr1-f69.google.com with SMTP id g3so1628959wrx.1
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2020 00:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WeCAJkUb+h6KimGOZfxLjvhINNCPL15NrlPSw5Ccpc0=;
 b=pK3n6gB5AX0RkGJP7wmXqeuMJfqLkZg2C6gi9i2OXxvojoig74QsOfardP7qSVsTLN
 bZTzNuUTdKO0I9Ho047SMTI7MvjU7DeSqqI0590oa+whCPL+PwR401jX8ryb92Mrm35D
 Si2/1o4N7rdjsQUtKOCKpmg5LfK7zeZhcQAQv6ljTsIK57s++GRLB2rlySr1SBbIONlW
 RtgR+XCzsCsdqrnU5NgfmxnuggCcuE5qMTJa/eIyamcOZyzVuh5mbCdxAKp805Fz/lYu
 /uYTWAgCTMBDhVl9LPsnB6QFFdHZjniY/9F8ByByPkayWQg5aKG5Bty8q/i9Tf9Z9b3e
 ybBg==
X-Gm-Message-State: AOAM530seUwXFcRh8GTItq4B4rQdGEM7L1P0xBIxFpvszgTJpULiOCAr
 zJ6triM6CLHXaGrotBnl71C4nfEBOPpTsI0Nu1wMxv6MVk1sFW8dz3DnDhaBidzHcnSdSSAxYjQ
 FBRziYqALwKPe
X-Received: by 2002:a5d:468f:: with SMTP id u15mr5770979wrq.336.1599033305230; 
 Wed, 02 Sep 2020 00:55:05 -0700 (PDT)
X-Received: by 2002:a5d:468f:: with SMTP id u15mr5770943wrq.336.1599033305047; 
 Wed, 02 Sep 2020 00:55:05 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id z203sm5747738wmc.31.2020.09.02.00.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 00:55:04 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Subject: Re: [RFC v8 3/5] memory: Add IOMMU_DEVIOTLB_UNMAP
 IOMMUTLBNotificationType
In-Reply-To: <20200901142608.24481-4-eperezma@redhat.com> ("Eugenio
 =?utf-8?Q?P=C3=A9rez=22's?=
 message of "Tue, 1 Sep 2020 16:26:06 +0200")
References: <20200901142608.24481-1-eperezma@redhat.com>
 <20200901142608.24481-4-eperezma@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Wed, 02 Sep 2020 09:55:03 +0200
Message-ID: <875z8wr4tk.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=quintela@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: ADotPUOqzV1E

Eugenio P=C3=A9rez <eperezma@redhat.com> wrote:
> Adapt intel and vhost to use this new notification type
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

