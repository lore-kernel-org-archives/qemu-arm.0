Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp3037149ejc;
        Thu, 28 Sep 2023 23:16:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJjnqwp1ZNpf6eMtpvVH4zwI4d5+7DCbIyTjdbdvsVL71zocR/tB3/T6y7mHqf+hvNWX87
X-Received: by 2002:a05:620a:470c:b0:773:ad9b:4c81 with SMTP id bs12-20020a05620a470c00b00773ad9b4c81mr3979259qkb.23.1695968205276;
        Thu, 28 Sep 2023 23:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695968205; cv=none;
        d=google.com; s=arc-20160816;
        b=Rf3dlTLtLYU3tR0RfdKIB0chVBrKKxn8LQXMUry+HrVBXUKLf6OtAMVynf0KmMA//D
         YipSQLisngCx9FiqKmvT2NutuWP6nmudWIZJZg0b0S3M+qLHcvnEHABUfs0IlqWflf8S
         PjrjHyV+gV1FILZrXQcxh0XhXYxjUy8DD4SztYpZkNmfitrk7Dp1uCt0unRKQdj7534D
         anBfDKE4PlVMEkb17oDaAewm1AUbniufQ3yOGpAJaLpIWrQ6zT/62jIiTat9RDonyWEP
         +0gxIpreaPPacNMCChFAvv+nf+z3rhhK6fWB0gABMdfkNAAxHeHVvvIpygY/Ix+vS4UN
         Z7cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=NucHUUeTrAeaMDZy+zvoac54bbIzDEUlGQXZWOU3Ils=;
        fh=VWuKj5IT3rv5dFF9iSlbu4Bb7v+IVvCNZAx4HyaZ0Tw=;
        b=PdSSbQQ3j6tmYVUsdvdOcYTotaxoOhBCc0NT/x3Y2bJtIAaHV4Wo2U2skNUg+9C0ZA
         W/TuiuuP53clWhBG4uHmT9YaEtaC8UM/22a9QD1RErrDjw4YElHVTgWJ9YN1C8cXqg47
         V0uC8fItE29rV9ZYP6LOKqOWpNeB6/kqOJfO6QAaKxTJO6FACh6/gFpLaV7Dlzgy5N8B
         qYhIR8VFCY6HhkGpp/Wu+iwgf7iKPKWkHRpdP2lCVlrVpjKSXhoYR3w+JndEVcux9hXT
         WWe9TIHoN3FyFpINMKM40VRKiu6DfUQYjGxd7xhisx89a3lKMVr9Gvx5diW//LTPJYeW
         bVlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fIZqAev6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14-20020a05620a0c0e00b0076da008f6ccsi9647872qki.288.2023.09.28.23.16.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Sep 2023 23:16:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fIZqAev6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qm6nj-0002y3-9w; Fri, 29 Sep 2023 02:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qm6ni-0002xJ-7F
 for qemu-arm@nongnu.org; Fri, 29 Sep 2023 02:16:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qm6ng-0002RD-U6
 for qemu-arm@nongnu.org; Fri, 29 Sep 2023 02:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695968192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NucHUUeTrAeaMDZy+zvoac54bbIzDEUlGQXZWOU3Ils=;
 b=fIZqAev6kn3Yua+H2uP+vpZ1UdW4VHnIoK/KwbKTE0hLe/8XSEHT+cSeFErTAGSsHdQOcx
 J+UGvv5oKYx2ta+CwrEjOY6hFRGZkZ7xlUidUU3qbawowgv+Lzg9tcsHkrVtRRvnlNEJlB
 +4Ozfwk1D0Qg5U4iQIgZnUiFAoXPjKs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-PRtLL9oPNE-S6NrvoAelWQ-1; Fri, 29 Sep 2023 02:16:28 -0400
X-MC-Unique: PRtLL9oPNE-S6NrvoAelWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE7DC800B35;
 Fri, 29 Sep 2023 06:16:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0E4910F1BE7;
 Fri, 29 Sep 2023 06:16:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B10B421E6904; Fri, 29 Sep 2023 08:16:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  Eric Auger
 <eric.auger@redhat.com>
Subject: Re: [PATCH 0/4] arm: fix some -Wshadow warnings
References: <20230922152944.3583438-1-peter.maydell@linaro.org>
Date: Fri, 29 Sep 2023 08:16:26 +0200
In-Reply-To: <20230922152944.3583438-1-peter.maydell@linaro.org> (Peter
 Maydell's message of "Fri, 22 Sep 2023 16:29:40 +0100")
Message-ID: <87msx5ijwl.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DnRcwHZu40Wg

Peter Maydell <peter.maydell@linaro.org> writes:

> These patches fix some -Wshadow warnings in arm related code.

Queued, thanks!

