Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1200508lfb;
        Tue, 12 May 2020 07:15:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypKt4NWCmDXBeoyRqRMpRNo8GAML9wC9hoRCsSjN9d3JLifd8ECdvbqAk3KQ0+sToeXOcs4R
X-Received: by 2002:a37:4dca:: with SMTP id a193mr21358542qkb.41.1589292952584;
        Tue, 12 May 2020 07:15:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589292952; cv=none;
        d=google.com; s=arc-20160816;
        b=bge9oFk+wL03KZUAeMZcBRNo2PpzERavxu3y0fha2ZDHrufRRXm8rzbC5VtRhERSAB
         Z/M/b4jBie9mmBi2pag5xRt0f5Wj9PcvOIsUELRIs+AYq/l69GOdYnoDfJ17kyr+mV4t
         0HMIswGZEl08HU6zGuyoNwt/7Orqlav+w7n7IesprBWjoqZE7fn2m/9Qd44/GBDLzgN1
         vcCRyzjsBKlvSTGMfS/LuLXncxlR0Vy2fCc6/OgMIKrjvYP/QNwF1CnrD491LDwiEyZq
         bDaiQlf2f1IcXJnA9ZiEvgROsHlBxhKoun0eFjpHAepwWq2vgLgcwIvElN6LscqhkOxJ
         JF7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=E2NMijGmhQfi+bbo11NyY2WASs+KWi/cO/qiUqTmweU=;
        b=GsQxB0zqZ9FxJ2h+JjHpg6fkzgmAND4vMvwxslzeibNBDb3k0scTZccnek/kM/VKAc
         gUtXxFRqgdXRqMcducuNDr1E9ZyB87ikvbyNDXlIRr2JmvW1gnhHJmLMqdfELCRZ2bsy
         cQl6APEOxITO7y5Y703YOEu6aeD/b+CrDOJ6bU/xvNH3H2wFoBoXNEjNgtQIOxVEmG2d
         tMeVfvKPEMIk+s4X/C335Ar5HsP+mIWEnYHZWDMmmQqHrh8RxsCYp+QqUGeIm2XzXOav
         2el2w3UDBMjSgY7xP3fPalbJ3fIrm+b5ck7j6fsqA3hrhzkWRnVxwXJxVC5B6MZOggGK
         yLvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a7LVwiI0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w31si7853477qth.131.2020.05.12.07.15.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 07:15:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a7LVwiI0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYVhI-000325-0a
	for alex.bennee@linaro.org; Tue, 12 May 2020 10:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jYVgc-0002Qp-SP
 for qemu-arm@nongnu.org; Tue, 12 May 2020 10:15:10 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35567
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jYVgc-0001x5-4s
 for qemu-arm@nongnu.org; Tue, 12 May 2020 10:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589292909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E2NMijGmhQfi+bbo11NyY2WASs+KWi/cO/qiUqTmweU=;
 b=a7LVwiI0W5bHkPY2MOLzkTgyYd1KMNkV11KisE7uQKVTBEOPOngoFFFfpIrxvfHmhwrFTw
 +LIZanXLzI/RqSw9f16J7YJJbvrQfoiNuP0Or4k/+dcXOEreuMqIUFDP7QJchr83KUEPLP
 Sf58jp7GAq42jnECLKIhcwFUURuIT1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-OPuvBqDAPsq-suwyHKYgIg-1; Tue, 12 May 2020 10:15:04 -0400
X-MC-Unique: OPuvBqDAPsq-suwyHKYgIg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4DFC1009600;
 Tue, 12 May 2020 14:15:02 +0000 (UTC)
Received: from localhost (unknown [10.40.208.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F24B10001B2;
 Tue, 12 May 2020 14:14:50 +0000 (UTC)
Date: Tue, 12 May 2020 16:14:47 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 1/3] acpi: Move build_tpm2() in the generic part
Message-ID: <20200512161447.07b76de2@redhat.com>
In-Reply-To: <20200506055747-mutt-send-email-mst@kernel.org>
References: <20200505144419.29174-1-eric.auger@redhat.com>
 <20200505144419.29174-2-eric.auger@redhat.com>
 <20200506063314.4qvnyfonjixcknuj@kamzik.brq.redhat.com>
 <20200506055747-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 02:02:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 gshan@redhat.com, shannon.zhaosl@gmail.com, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, eric.auger.pro@gmail.com, lersek@redhat.com,
 ardb@kernel.org, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uJbp4Rdw2TeY

On Wed, 6 May 2020 05:58:25 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, May 06, 2020 at 08:33:14AM +0200, Andrew Jones wrote:
> > I realize this function is just getting moved, but maybe it should get
> > converted to the build_append* API while being moved?  
> 
> I'd rather refactoring was done in a separate patch -
> easier to review.
maybe first convert and then move

PS:
me wonders if we have test with TPM enabled, if not maybe it's time to add them
i.e. first goes testcase in bios-tables and then refactoring/moving
in that case review is simpler.


