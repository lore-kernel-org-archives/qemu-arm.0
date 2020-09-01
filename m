Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4940939lfc;
        Tue, 1 Sep 2020 14:07:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzr5dgfCD+m/0mXpQgiYgSrYpZpbS4dsF/PYgb3Kn0Mj0yndZQVuLgKvUjm+qcMsaSY8RUO
X-Received: by 2002:a63:6dc7:: with SMTP id i190mr2992999pgc.27.1598994472577;
        Tue, 01 Sep 2020 14:07:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598994472; cv=none;
        d=google.com; s=arc-20160816;
        b=XPYXJaFubLBJKMJlZNKPSfOHyfPiOPJsIKem7lf7eRuWAb4w7KyLEIDdHhfDbwJiWX
         eCx0eR5ehJXa24A+gzDMlMxii5sEWH/2/AxOoizE8RRUguOKmerTONhCrRo6XUXGglL2
         OUX4/Wz6Cjp2988CJ01VSfeev8e1jmLROawsXCRvMiK6QxZKvdhYNzgOc0hNy8gh6DbP
         rb6Df2m1GDvYcyKviWYN55DhzPnLN6I6oVRL8I8DKJJJuAOnFXl47g9konXqlDksVrOm
         qze3ZQaFJy13Ng/oevwLF9bW6JjMHwKaFB88X8/fwQofHUlc+FPjxFN/zA8Ov0UBiwTW
         1QTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=6DaypNNANIevQD4AzCg2EyiYu4Ha0XpTZGt1eASHuNM=;
        b=zWy/JavW1IoQwvvt/G8YsrPEQ8xKNg+qrLUa3PZjqH9od4AdJs5jNOwMHTeqmfYPhL
         nJTEXndEQdAiOJbquXVDPLwmzpSSExLa/V1mVU6KKYGgYgXVGsMHQl51FgcfkBoBv/hR
         /FbHw6Idl78U9MOfdqEMXyWgmKTSTOhUw3majOFVqCVkMdcMSRghzJoha/97s8LHZAHF
         vT3lZ7H3cgDNT7Wzz9gJxsvqutqRwJXiC7Pz23rEgXl9rYcbcc+1CqhP7IWHlzEJTmFZ
         hfUP2+HjfieV05ZlrnkLe+gIzgz4UGhl8gpzvvZQfo56IF/yroz0MWlgmj8rhwNEM7vr
         2Uig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eXl0Vl4v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7si2089137pgl.410.2020.09.01.14.07.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 14:07:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eXl0Vl4v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDDVP-0007gR-Lb
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 17:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kDDUw-0007Uu-Hr
 for qemu-arm@nongnu.org; Tue, 01 Sep 2020 17:07:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kDDUu-0000zc-P9
 for qemu-arm@nongnu.org; Tue, 01 Sep 2020 17:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598994439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6DaypNNANIevQD4AzCg2EyiYu4Ha0XpTZGt1eASHuNM=;
 b=eXl0Vl4v6yI1VnXm7qhmdWD98Kr+PQf+Xa54IrinLrxwFRcLhKcyP/JS5Bb6/7O+I9+EP8
 v545aZbjHuz8GiKppq0MsG/NM6oGUtv4O5iwe7ObsUge05utN3Q2zr3ieodTchJVIoMWo4
 6eVM+vPlhz4DbK5SagC5d4HgSfGhRqY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-YdIexN9tOUmKmHwqa6qTUw-1; Tue, 01 Sep 2020 17:05:50 -0400
X-MC-Unique: YdIexN9tOUmKmHwqa6qTUw-1
Received: by mail-qk1-f200.google.com with SMTP id x191so1887301qkb.3
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2020 14:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6DaypNNANIevQD4AzCg2EyiYu4Ha0XpTZGt1eASHuNM=;
 b=Ed+7679OOD3MSxVVtXH9utYMcRuEjgpdTdAkwSA1POipppbPabjd7v5z75Vo+KDhOL
 kDDXxWdDh3QhKCIxYhARqR1qo5udOintYzNMO5hPLFDuoN7E8dKqQ/6r2Is3Wfp72kYT
 Z++8w2fuapeu6Q6RFc7+dQ8HTzaMDegN2ScdSUFVuveE3hyBKnMkeNwDx5AV7rOAjDIh
 5sy4OaoNSFZCWZBXFebN3hP3jAxNvUkxVvyjABxAmMaCIxMoZ1TRddfA4WETFw0sEGaA
 U4QVNNrBmrD9vTUjc+XYUG/PwnWTdmZpSpXXFaRYRH8g9mbZRWtL3jMVUFffV4+5tXrz
 ehnQ==
X-Gm-Message-State: AOAM532KakTtdXHG6pPayK1JlQnbf/KTQe/f0DTEznF7/1JwwnSTfHmf
 44UrWKm92PLZFVyDlVN5HljhxdZTULEfkJ1q6dJUexOm5McXEaxv5YocYGKKK3Lxij9hEaXcP16
 +sW0PbVACyiQP
X-Received: by 2002:a37:a482:: with SMTP id n124mr3790059qke.339.1598994350033; 
 Tue, 01 Sep 2020 14:05:50 -0700 (PDT)
X-Received: by 2002:a37:a482:: with SMTP id n124mr3790034qke.339.1598994349826; 
 Tue, 01 Sep 2020 14:05:49 -0700 (PDT)
Received: from xz-x1 (bras-vprn-toroon474qw-lp130-11-70-53-122-15.dsl.bell.ca.
 [70.53.122.15])
 by smtp.gmail.com with ESMTPSA id f7sm3014945qkj.32.2020.09.01.14.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 14:05:49 -0700 (PDT)
Date: Tue, 1 Sep 2020 17:05:47 -0400
From: Peter Xu <peterx@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [RFC v8 5/5] memory: Skip bad range assertion if notifier is
 DEVIOTLB type
Message-ID: <20200901210547.GG3053@xz-x1>
References: <20200901142608.24481-1-eperezma@redhat.com>
 <20200901142608.24481-6-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200901142608.24481-6-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 16:44:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tucxzHTuqfp1

On Tue, Sep 01, 2020 at 04:26:08PM +0200, Eugenio Pérez wrote:
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

