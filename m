Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3074100lfa;
        Mon, 26 Oct 2020 10:38:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYp/bbnBR1Uw+cScqRcL2IPlviAFHCubUf4RCnA3zK+6E+H5N4nx/Jm9qxUgoMVAcADd1e
X-Received: by 2002:a37:dc2:: with SMTP id 185mr2224945qkn.103.1603733936565;
        Mon, 26 Oct 2020 10:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603733936; cv=none;
        d=google.com; s=arc-20160816;
        b=uvSP0USsS/G0Q59LgIv99g2Whc+0uhFRi8UvVOsQN3IMCv37X9tYzqO6mKpWv44qEi
         llZOfnBl2Pg9qLHF6mZzBBiyuILnckEMofHH+Yz8eXuO7mg5YOSCGzVGdiBNI66HtQS8
         KzSNWTt/2xIKUQGqlsoX+kieAOzmCYa7aaMTyApVTylV8d4M0ecZbohFcvwwJHWCXPYv
         xdhM83uBhaOU+YsU0oYAwqSId/GY5DZqz/4Q6W0+v2UqypueOOKCuJ5mu6MeTR/5oMHo
         heH5qB4lG1F+9jyr07AZL8I1WHwdfFU8JyW8qvGJZKqLV9yQBNe03dhOkd51CTDODQHY
         yGaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :mime-version:message-id:subject:to:from:date:dkim-signature;
        bh=PR/Xi/vZptZNXMDla+ROkGOGEHfql4Pe4OKWWxizXe0=;
        b=fd/kKche/unKlgbKouS4XL7P2bTjdbAHUJFywglwX55GaGXt65WTzzA5uoSgAcesTi
         K/6UOZ7WhklOeqxxYm/b94oxIb5aqg8ARNQDL1BlLhdAVx3WPjGa2azKZV58c+kIVp8A
         dFLwu7VVnEwsLM3mZayKN9+hvrO+dgbhjlUiZwzkh+T6QQzU/rK0E/uxlT4M1/2Di19g
         lMCAgVODJfyjvUCNpLgsvXg/qqaOmEGPD5NlVfO/2ZOkSKBs2dgtLQ58pbRuev1V2lIS
         IoHGTvJDClZxnshI1AnJDHfOrbLg47rzb8ExLIR9QE9xhNqxVUzOIXNgxamTpEJ8STPE
         qHgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E7Q1HVn7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i25si6541428qkg.235.2020.10.26.10.38.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Oct 2020 10:38:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E7Q1HVn7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kX6SN-0008TJ-Vg
	for alex.bennee@linaro.org; Mon, 26 Oct 2020 13:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kX6CV-00049A-60
 for qemu-arm@nongnu.org; Mon, 26 Oct 2020 13:22:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kX6CP-0000al-8t
 for qemu-arm@nongnu.org; Mon, 26 Oct 2020 13:22:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603732944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=PR/Xi/vZptZNXMDla+ROkGOGEHfql4Pe4OKWWxizXe0=;
 b=E7Q1HVn79mp6JbctFqUmm8tQZbOw+sSAjL3v0+QHzxOw+YPEy5GcR1s8KjGp49jKLG5AOd
 CQmuW6r2WdF7wxfqqnrThP/ZqGjFY18EMVnoXOfKClBs6UDY3WMw2+12+x7U11rVpgdanv
 Du5BZ4xIJvHpp//+ImLvpgHDCcp2Cfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-dAbtAQCtP4KWcYKzZJB0xA-1; Mon, 26 Oct 2020 13:22:22 -0400
X-MC-Unique: dAbtAQCtP4KWcYKzZJB0xA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D60246123A;
 Mon, 26 Oct 2020 17:22:20 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 992495C230;
 Mon, 26 Oct 2020 17:22:20 +0000 (UTC)
Date: Mon, 26 Oct 2020 13:22:19 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Dynamic instance properties in TYPE_ARM_CPU
Message-ID: <20201026172219.GA5733@habkost.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 02:39:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r42C+FX66lKy

I've been trying to clean up the qdev property code (to bridge
the gaps between qdev and QOM, and between QOM and QAPI), and
I've noticed that TYPE_ARM_CPU is the only remaining user of
qdev_property_add_static().

qdev_property_add_static() has a misleading name: it won't
register a static property.  It is actually a hack to use a
static Property variable (defined using DEFINE_PROP*), but
register it as a dynamic instance property.

Dynamic instance properties make introspection hard.  What can we
do to get rid of them in TYPE_ARM_CPU?

Can we just register all the properties unconditionally, and
error out on realize if the requested CPU configuration is
incompatible with the available CPU features?

The following properties are registered as dynamic instance
properties at arm_cpu_post_init():
"cntfrq", "reset-cbar", "reset-hivecs", "rvbar", "has_el2",
"has_el3", "cfgend", "vfp", "neon", "dsp", "has-mpu",
"pmsav7-dregion", "secure-memory", "pmu", "idau", "init-svtor",
"tag-memory", "secure-tag-memory".

-- 
Eduardo

