Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2866264njb;
        Tue, 18 Mar 2025 04:55:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMQFeAMMT4ApZVqLxMHwgSSSEvHrhUfb8WYUI8EFsoc3tqe4jZuyKiQ630KUhKy2G6ZQ7WzFkYcaEZhA==@linaro.org
X-Google-Smtp-Source: AGHT+IHoprAKh0mV/4rejUzbzCAGx9Ezwfw4B6X0xy96mfS/GVAwIxTCKZcZTIQE5gLsIWzgbTaN
X-Received: by 2002:a05:620a:2481:b0:7c5:65ab:5001 with SMTP id af79cd13be357-7c57c8abdc0mr1460954085a.39.1742298934792;
        Tue, 18 Mar 2025 04:55:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742298934; cv=none;
        d=google.com; s=arc-20240605;
        b=QQMkpUc6BU1F9BSu4pe8M9vzfZ/aMhFptuFZJUtfeGDkdAvgTwzmPes4wXheGgBrMM
         ApgS54wp57P/EKXgWKDYELLBNP5m3QzYRcIMCDKTRa/mOhqnNnRP+vXnI/romZOKerRg
         utllFcjtNf4mZmrVwCvUXWC4+RCvHnHn8b51MUI9PIlh4xtOM+O55LNvGSPOTXWj/ELj
         48iXeryNlQB2S+/8GDfe9FP/9jxz9PqbJ8jpyaHXslYMuqzMDZfXiwZvdPQmi6bk/xpD
         kvSNTyJCMYvk9lTAIF/X/pllUSuF/LMe41nYAzkBbtqQB3g9pgQ/A4BgXhRvtJ6hIoip
         I1Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=x1yqtzfKxG2zu6m5LfqDvloNdABDX3NgDNb0KbZo22A=;
        fh=4yjExnyc+rO6t1EQFw3oJK8R7fGJ1RylpulJxkFF7fU=;
        b=WBTXcYesfvC/EqE6Lw2i76vr6DYHRd0P4WmWhOnY5GOS+TNNrqur4mdfCFJ/vwCrfM
         tsY6LgqC/s21M3HkUkdCQPbCwthZTocC6SOwaMf8XrkQnqle1hzB1BBBuH8aGlwaQ4cH
         bWBWUW0OpkRKrQy4XNv8COJF89cM/mGmD7ElI0WTdj9JfOM1kz3aDk7grX8K8wE3fObu
         bX6B8rBXZOhmyOqtdNYUW+7kamdTcR/mhymX9DiH5t+hbBAN4AkPy4qP2pu4cpwV9KR/
         q/ipPuME7mAUXpGrV+LmgjFtuWqHusEWeMlgziV+6sfO/3C/0N9glZ3cPZd/czTbgM2W
         cUyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Nd7PjEo/";
       spf=pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573cf00desi1157312985a.420.2025.03.18.04.55.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 04:55:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Nd7PjEo/";
       spf=pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1tuVXc-00057H-9g; Tue, 18 Mar 2025 07:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tuVXW-000565-75
 for qemu-rust@nongnu.org; Tue, 18 Mar 2025 07:55:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tuVXU-0003tw-Ib
 for qemu-rust@nongnu.org; Tue, 18 Mar 2025 07:55:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742298918;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x1yqtzfKxG2zu6m5LfqDvloNdABDX3NgDNb0KbZo22A=;
 b=Nd7PjEo/BxpMgqOJY708MOOtPmufiGCXqi37/yLl3XodalOcvoqoa0pyoL0gmzRMjyy1Ir
 fJbLWxHGyetB+dj/mCXJ+I+jhpCC/9fdG8YqUhEJSxhGLPnxuhqL1666FmGDZMgdH3nuGg
 jnz54ryTvEkKXxHgRMLsM2SIrOpjEFo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-582-t19GnOxdOD6ONvH022ngsA-1; Tue,
 18 Mar 2025 07:55:14 -0400
X-MC-Unique: t19GnOxdOD6ONvH022ngsA-1
X-Mimecast-MFC-AGG-ID: t19GnOxdOD6ONvH022ngsA_1742298913
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 094DD180025C; Tue, 18 Mar 2025 11:55:12 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.167])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 41CD63001D0E; Tue, 18 Mar 2025 11:55:09 +0000 (UTC)
Date: Tue, 18 Mar 2025 11:55:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-rust@nongnu.org
Subject: Re: [PATCH] rust: pl011: Cut down amount of text quoted from PL011 TRM
Message-ID: <Z9lfGeUjyJcPU6_x@redhat.com>
References: <20250317173239.941034-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317173239.941034-1-peter.maydell@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MD1Mw4jcaWp0

On Mon, Mar 17, 2025 at 05:32:39PM +0000, Peter Maydell wrote:
> Currently the comments in the Rust pl011 register.rs file include
> large amounts of text from the PL011 TRM.  This is much more
> commentary than we typically quote from a device reference manual,
> and much of it is not relevant to QEMU.  Compress and rephrase the
> comments so that we are not quoting such a large volume of TRM text.
> 
> We add a URL for the TRM; readers who need more detail on the
> function of the register bits can find it there, presented in
> context with the overall description of the hardware.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  rust/hw/char/pl011/src/registers.rs | 261 ++++++----------------------
>  1 file changed, 51 insertions(+), 210 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

