Received: by 2002:ac2:5bdb:0:0:0:0:0 with SMTP id u27csp379493lfn;
        Wed, 27 Oct 2021 08:12:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3gddtfSjbI3150KF3k3ZseGW5Dnq9WVZFWE6omIa0ZAHvL5UdgfZOF4jywfFa40iuHcXc
X-Received: by 2002:a05:6102:6d0:: with SMTP id m16mr3822068vsg.51.1635347524419;
        Wed, 27 Oct 2021 08:12:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635347524; cv=none;
        d=google.com; s=arc-20160816;
        b=mgUHnyzUZyScMW5yQ5oywR6Q5+DfcIfKVi4T3JuhiYcuLgegDTkcCJidc8owXf5Vpa
         nUlRXAy8ez3AaV2WTE9Zs63B4SVrRByhSfXDsClxO5jcdq+nsGDccCBGoa0vRC4y/m+7
         ag1CgjtHs9zPnznFIza26S2kWN4PjiH63pWbJ7//tyCcTj6SflaAKqogZsAzVznsFHvd
         gcQpXG/H/JnHa9KYWQ6Wa2Ehh1lLK/+gg81etGBuWE1chXK58BhVuLSGNTKuPbqePeOX
         pXN7NX730PZlzZlHPRSgFl4UoUETFf6wv79HkWnwMeodEn8NRd9aJ4GuYoMTgmYBQJK2
         uygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=PnIdW+DHvgHFNRa+Ue3gGMMML41h2EqhG4MYKV4I+7c=;
        b=lV4xj9+l4ZM9J55rj23BZgzQg3MoWedyvE0+o4SB1X7DlOAdY0c9yHYc5z5BpVTV4C
         3dcU21agKL0c4QCO3Wz5qgD4nYEjOzt9gJxQ4Jo6b5vQCRlDjj06dt9ycnlSegyMNstg
         yXZZJoUaqrvTiiNz+LEihq3cfIAkMeqCr6p/97zMj6VjIdcCb3RT1FtMAa7muFDvcglc
         2v7ITpM8xBJkUG8RKQfcHUlrTUpD++PxOn0crTLqpw+jpROCUAenptj8zFRg3gm0698k
         ApwUpcr70i/XAI5feTYWSlLG2cvskZlMGmbiAGwK2LVLpcmsFXhvmRTDKQwjfJhZXdcX
         9NPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bypd0dCM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s28si330091vsj.437.2021.10.27.08.12.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Oct 2021 08:12:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bypd0dCM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mfkax-0006lA-HC
	for alex.bennee@linaro.org; Wed, 27 Oct 2021 11:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mfjqI-0004IH-Tb
 for qemu-arm@nongnu.org; Wed, 27 Oct 2021 10:23:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mfjqF-0007UX-51
 for qemu-arm@nongnu.org; Wed, 27 Oct 2021 10:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635344625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PnIdW+DHvgHFNRa+Ue3gGMMML41h2EqhG4MYKV4I+7c=;
 b=bypd0dCMghqwmaJfD4/D3T15tmCe88Sol2FBn1r76WwyRilIWeIyBYWnt5CmSlPFyfizfI
 s7ynj7t0fhZpnSHQWzF0k0NzPuUovOuwTMWP46oGoJrXKrq/nbKZ0aPARK7zUduSF7sTZN
 pBkmajAb3jSB8akUE4IuIH6jEi4jp1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-lWrYexuGO8WjWYstOZbzsw-1; Wed, 27 Oct 2021 10:23:43 -0400
X-MC-Unique: lWrYexuGO8WjWYstOZbzsw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1A8410247AB;
 Wed, 27 Oct 2021 14:23:41 +0000 (UTC)
Received: from localhost (unknown [10.22.17.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 803511002D6A;
 Wed, 27 Oct 2021 14:23:29 +0000 (UTC)
Date: Wed, 27 Oct 2021 10:23:29 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 1/3] smbios: Rename SMBIOS_ENTRY_POINT_* enums
Message-ID: <20211027142329.lcsday3kbet6pplz@habkost.net>
References: <20211026151100.1691925-1-ehabkost@redhat.com>
 <20211026151100.1691925-2-ehabkost@redhat.com>
 <20211027034303-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211027034303-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i8wuP9mldRI4

On Wed, Oct 27, 2021 at 03:43:43AM -0400, Michael S. Tsirkin wrote:
> On Tue, Oct 26, 2021 at 11:10:58AM -0400, Eduardo Habkost wrote:
> > Rename the enums to match the naming style used by QAPI, and to
> > use "32" and "64" instead of "20" and "31".  This will allow us
> > to more easily move the enum to the QAPI schema later.
> > 
> > About the naming choice: "SMBIOS 2.1 entry point"/"SMBIO 3.0
> 
> typo in commit log

I'll fix it, thanks!

> 
> > entry point" and "32-bit entry point"/"64-bit entry point" are
> > synonymous in the SMBIOS specification.  However, the phrases
> > "32-bit entry point" and "64-bit entry point" are used more often.
> > 
> > The new names also avoid confusion between the entry point format
> > and the actual SMBIOS version reported in the entry point
> > structure.  For example: currently the 32-bit entry point
> > actually report SMBIOS 2.8 support, not 2.1.
> > 
> > Based on portions of a patch submitted by Daniel P. Berrangé.
> 
> I think you need the original S.O.B here too then.

I'm not sure it is appropriate here, as zero lines of code from
the original patch remain here.

> 
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> > First version of this code was submitted at:
> > https://lore.kernel.org/qemu-devel/20200908165438.1008942-5-berrange@redhat.com
> > 
> > Changes from v2:
> > * Use "32" and "64" instead of "2_0" and "3_1"
> > 
> > Changes from v1:
> > * Patch was split in two
> > * Hunks included this patch are not changed from v1

-- 
Eduardo

