Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp542408lfc;
        Wed, 26 Aug 2020 01:03:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqakAyIawhqSkDItdBc1aBKBx/STrMqpeTd2rdlmTe1tKQyLuftb+vqvgF6UWujKQrAugz
X-Received: by 2002:a05:6902:4b0:: with SMTP id r16mr18261640ybs.419.1598429026056;
        Wed, 26 Aug 2020 01:03:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598429026; cv=none;
        d=google.com; s=arc-20160816;
        b=LP9Ww8eH88bDxLX4IFbNtDjFNwc/C3Fb94e/c9fqrJ51+yq1DAqXyqGGAnhC4aRNj2
         x95xzHzFJkTG1IR+SAO3kYiLRWg3DvEXV3lMgJzh5BmVculFZbGwDE7/9R0+77kRs8Dg
         LPyqsqHzuKC0M+LnpkjyKF2n38+C1osRZE2w+CH8THVL1+JsksieUSIKmOQ7gnN+1H5b
         xhEMnhr92Ozb9yvK3GY38VqlFvAC5XRna7fYEG9CTz27Hwz/kdZ6S7r1ruSIJD1HrHGD
         0nUkSUsiQGFkr0KEr2aMWy5LqURuy65rrJEGPzgGjyoEBFRpQkrD0Ut+jWdHryOUPHMk
         bHwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:to:from
         :dkim-signature;
        bh=puHIupXWh/98+bp39BUwitjkfVs8C/U9AeQWj8Mpo1w=;
        b=HQMHXfQMfLDhQsaS9opuQ1NMdDhzz2Cq9S59tRTpBzUUVDvhwgMOUrzH+fC+GrEDdT
         AD4v+KoRwMrfRfkHURdJ6a349RcaeP7DjxoVqFRw8VK4LXluHEhos1/NKLEiVsX3GqWJ
         mQUPSLN74ZsYewl2gHNR3am8ic1ZXVX9yjSd3lvKLauewgPmAeihjdw/eBElShKN/zC2
         Nr32jpfo4hwi2PcNdSn9zvtCazD6kbhDDZ9oH+Jj7S6lUT91+IEupYaDcWj77q2p3Srz
         QBzEfcfikiObNCBMuoAOxp9OnbMrH0Zu3WBBQQCX3Fkk7jGQ8CTRJ/VbK4AvV9iZTDzF
         LoQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XfavUy3A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x190si1722124ybg.38.2020.08.26.01.03.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 01:03:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XfavUy3A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAqPJ-0007VN-FW
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 04:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kAqPA-0007UU-S4
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 04:03:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kAqP9-0004J0-5c
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 04:03:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598429014;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=puHIupXWh/98+bp39BUwitjkfVs8C/U9AeQWj8Mpo1w=;
 b=XfavUy3AU+jykyIuXVqB/x5cnY/ZuKlg8ZiCRDWpWZSDeOC6meACfnueaX5E7gRS/vx4Db
 FkQpIdX10fUi1qJrqKhNooJrfyNJuXL5/r9BlMs170wGcPgPilfVcrJTgr7K4q1DrwTsBR
 We1GANDAF0VVWO2z3PurtvvAaxAtgNE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-vaUmLokkP6W0VGfJi-s6-A-1; Wed, 26 Aug 2020 04:03:32 -0400
X-MC-Unique: vaUmLokkP6W0VGfJi-s6-A-1
Received: by mail-wr1-f69.google.com with SMTP id p16so228389wrf.16
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2020 01:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=puHIupXWh/98+bp39BUwitjkfVs8C/U9AeQWj8Mpo1w=;
 b=ZnzVG1CsK6SgnXeMg0WF/c675Ll/nVGS9PVyGqI72FishZifTDTmjHxXRbUdTtb94k
 IeEW/hEfc+kpIGJ2rnu2p1+T7cVyjiz7crqLUCiDon0aCrHLSzIvKMdImVv7PZsgV699
 o/dkSQDBuojuurgyAyaBFVEJbfX6w3j166BU+1cm55qaA+NXKmCNH5lSmzYj2HMzWfwn
 sFOpVK0vU24X2Tf/kTB2CtG95nQgK470N0IRBMSYr3m2T9XDOigz05zoUn/zu2A2mIFC
 D0qddkmNiSTGYgErCIB/1YTOo1WEoKKlj98iCCekjeuy8sW15E7WWLpB9hIVQeDN9ucH
 +e7w==
X-Gm-Message-State: AOAM5334CU4z5upy31ElgeljcXe0QVpqZiUgV8X2i8+yxitsd0tS08U6
 nI81wgCxgcauefrXbU5S9fJfb7h12IGPZbFYwg95Omyk2lz7kcnRdCtwxeXT/jQ7TJyB+qJhV1F
 y7CqRPrCS0TnW
X-Received: by 2002:adf:e80a:: with SMTP id o10mr13873944wrm.312.1598429011850; 
 Wed, 26 Aug 2020 01:03:31 -0700 (PDT)
X-Received: by 2002:adf:e80a:: with SMTP id o10mr13873921wrm.312.1598429011548; 
 Wed, 26 Aug 2020 01:03:31 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id v9sm3765370wru.37.2020.08.26.01.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 01:03:30 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v3 65/74] [automated] Move QOM typedefs and add missing
 includes (pass 2)
In-Reply-To: <20200825192110.3528606-66-ehabkost@redhat.com> (Eduardo
 Habkost's message of "Tue, 25 Aug 2020 15:21:01 -0400")
References: <20200825192110.3528606-1-ehabkost@redhat.com>
 <20200825192110.3528606-66-ehabkost@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Wed, 26 Aug 2020 10:03:29 +0200
Message-ID: <87tuwpygtq.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 23:30:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "Daniel P.
 Berrange" <berrange@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jS6w5wBZtx90

Eduardo Habkost <ehabkost@redhat.com> wrote:
> Some typedefs and macros are defined after the type check macros.
> This makes it difficult to automatically replace their
> definitions with OBJECT_DECLARE_TYPE.
>
> Patch generated using:
>
>  $ ./scripts/codeconverter/converter.py -i \
>    --pattern=QOMStructTypedefSplit $(git grep -l '' -- '*.[ch]')
>
> which will split "typdef struct { ... } TypedefName"
> declarations.
>
> Followed by:
>
>  $ ./scripts/codeconverter/converter.py -i --pattern=MoveSymbols \
>     $(git grep -l '' -- '*.[ch]')
>
> which will:
> - move the typedefs and #defines above the type check macros
> - add missing #include "qom/object.h" lines if necessary
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes series v2 -> v3: this is a new patch added in series v3
>
> The script was re-run after rebase and after additional patches
> were added to this series.
>
> This is being submitted as a separate patch to make review
> easier, but it can be squashed into the previous patch once it
> gets reviewed.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

> diff --git a/migration/migration.h b/migration/migration.h
> index ae497bd45a..4103e549bb 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -21,6 +21,7 @@
>  #include "qemu/coroutine_int.h"
>  #include "io/channel.h"
>  #include "net/announce.h"
> +#include "qom/object.h"
>  
>  struct PostcopyBlocktimeContext;
>  
> @@ -114,6 +115,7 @@ void fill_destination_postcopy_migration_info(MigrationInfo *info);
>  
>  #define TYPE_MIGRATION "migration"
>  
> +typedef struct MigrationClass MigrationClass;
>  #define MIGRATION_OBJ_CLASS(klass) \
>      OBJECT_CLASS_CHECK(MigrationClass, (klass), TYPE_MIGRATION)
>  #define MIGRATION_OBJ(obj) \
> @@ -121,10 +123,10 @@ void fill_destination_postcopy_migration_info(MigrationInfo *info);
>  #define MIGRATION_OBJ_GET_CLASS(obj) \
>      OBJECT_GET_CLASS(MigrationClass, (obj), TYPE_MIGRATION)
>  
> -typedef struct MigrationClass {
> +struct MigrationClass {
>      /*< private >*/
>      DeviceClass parent_class;
> -} MigrationClass;
> +};
>  
>  struct MigrationState
>  {

Reviewed-by: Juan Quintela <quintela@redhat.com>

for the migration bits.

