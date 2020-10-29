Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp391783lfa;
        Thu, 29 Oct 2020 03:17:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1rD78yMQT6V8SI3hMrxZ5ihWjuQwNhVOyKXlIkmCEN6Z5pRjP76GRpvDuGQW6w/YKHgJk
X-Received: by 2002:a02:666c:: with SMTP id l44mr2845603jaf.100.1603966666981;
        Thu, 29 Oct 2020 03:17:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603966666; cv=none;
        d=google.com; s=arc-20160816;
        b=YnqMLAFLvObs8Pb4F/C61dtA5RTtiVQlMFhEFFWXOkbAjTFNbWHb6zir2Ws8J99DOw
         nePCDd8GC8Qwvw3zXwO+r8+jukuiGiIFU8Cth+h61+Z4TOep2i+5404J74/65zc0QkRh
         UNpGAHG4nePT4d81IR8qeejKX7KK1oaRmMk1NeLSzUCjyfWqh5bNG5eIcGETcRUaBQw+
         W6uTkwm3nGq/vO5ejpEmCstnA+1mxWwWSQqt9JcmWj5ULlHtvd5kOrkjLw7u+DQpA0D4
         RqZmz5V9vaLNWvs+WGC3Pox3kgc2bx1H9XS9tDpeJnMAGNu09DLWE4y4tzmS8XwJkHS+
         xphw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=NrVaxvz/l21RWdvrsuccogGz5MtGr85aWpocAEEct5Y=;
        b=rfqXYsJOEIOqKiKSrCVm8NFaINKJQ22t7y1XaqDKiFCSTGLhJMOyiadWh/wSJTNKeO
         tvBPIwy0PXjYtNSMSiA9TB5FFf3eHMf5qUJfCByVeZJuF55SBJ7i2iyr36hqHi2MFdY5
         RBWpNY0S8tbVfUXIQXyYPkOe2r8jTGhnvUzlbR3oMR+6h1hTA3ZFEQExSxww9fVjceDw
         s5t5l/Uz8RwebdSf/jpf5VcEa+DbZopjyBR/DcHNeHBDH5waGNXx0LnYNvmmf6NdXU4+
         /3zpRJtlFpi1Ty+yYmZ9wrw1sOk5DfrvRXx718AJRD88DGWfLg8bvvd0ki5XjjO8Kkz5
         mJMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dzjUyvS7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13si2097988jaq.111.2020.10.29.03.17.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Oct 2020 03:17:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dzjUyvS7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kY506-000129-9j
	for alex.bennee@linaro.org; Thu, 29 Oct 2020 06:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kY4z3-0000yx-LL
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 06:16:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kY4z1-0004zS-5W
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 06:16:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603966596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NrVaxvz/l21RWdvrsuccogGz5MtGr85aWpocAEEct5Y=;
 b=dzjUyvS7V/b0F1iBcY4gkk9g7gW8Jc+gbTFWlEIYYUhAMamA9UDX9OFwJq/s9HleYoUDhz
 U60KRc3V5sLBc1zJNfln3/FUmsE21Nq+53rIw4T4gwiOwosihsU3ZJQOcpbdip6XsxUYSa
 clF+Arleenk7+x4jPq/SsViqhtw8iaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-Y37L0-w7O0WGcr15A3i0rA-1; Thu, 29 Oct 2020 06:16:33 -0400
X-MC-Unique: Y37L0-w7O0WGcr15A3i0rA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6376107AFB6;
 Thu, 29 Oct 2020 10:16:31 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA3F75C1C4;
 Thu, 29 Oct 2020 10:16:29 +0000 (UTC)
Date: Thu, 29 Oct 2020 11:16:27 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: Dynamic instance properties in TYPE_ARM_CPU
Message-ID: <20201029101627.umh4gqxiujwde4xp@kamzik.brq.redhat.com>
References: <20201026172219.GA5733@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20201026172219.GA5733@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 01:47:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ca1vzBZBF2RY

On Mon, Oct 26, 2020 at 01:22:19PM -0400, Eduardo Habkost wrote:
> I've been trying to clean up the qdev property code (to bridge
> the gaps between qdev and QOM, and between QOM and QAPI), and
> I've noticed that TYPE_ARM_CPU is the only remaining user of
> qdev_property_add_static().
> 
> qdev_property_add_static() has a misleading name: it won't
> register a static property.  It is actually a hack to use a
> static Property variable (defined using DEFINE_PROP*), but
> register it as a dynamic instance property.
> 
> Dynamic instance properties make introspection hard.  What can we
> do to get rid of them in TYPE_ARM_CPU?
> 
> Can we just register all the properties unconditionally, and
> error out on realize if the requested CPU configuration is
> incompatible with the available CPU features?
> 
> The following properties are registered as dynamic instance
> properties at arm_cpu_post_init():
> "cntfrq", "reset-cbar", "reset-hivecs", "rvbar", "has_el2",
> "has_el3", "cfgend", "vfp", "neon", "dsp", "has-mpu",
> "pmsav7-dregion", "secure-memory", "pmu", "idau", "init-svtor",
> "tag-memory", "secure-tag-memory".

Hi Eduardo,

Are properties added at runtime with

  if (this_config_wants_this_property)
    object_property_add(...)

also considered dynamic instance properties? If so, then
arm as many more than the ones listed above. And, if not,
then it should be pretty easy to convert the ones listed
above to this if-want-add pattern.

Thanks,
drew

