Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp544619lfc;
        Wed, 26 Aug 2020 01:06:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLyY+/LG5St0ElrQUQPSsBUTluMR251BzCauMGd8fRZya1XcxDzg7pER/HfqUZV+CXm6b3
X-Received: by 2002:a25:1fd5:: with SMTP id f204mr20931751ybf.236.1598429217830;
        Wed, 26 Aug 2020 01:06:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598429217; cv=none;
        d=google.com; s=arc-20160816;
        b=WXX0+L4ie3KDoLOjU0LstaaZnsoZaelMgX0li8mwue5RjXtfATrQQZhzRO/m4idYQA
         ekOfjPEUljfhd2GHJSQ1KlWNvGI2L3NSNQ9tDJC/KZlaFOCYE0iA9lDP0f3F7MXdBycw
         35nJFDxVu/LqmXEHUsEKc7kfjyrG2A8afAR3yyF8FaNj5uyiP2EEL3mUvwEXfV8c8bSj
         OyJ4GlD3XGCaJ71bk46TaPikvAH3hiQjdrUYmO4UATYSTEZyPL4rNTJCQzy4FwcEHFzn
         UdHvW5rgXbAYph5GaHQS+wbL2PcQ/VOnoFAyrqC9V/ZaQGylJnYucD/dQUIcuycadc/X
         dUAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:to:from
         :dkim-signature;
        bh=eB8Jf216QnsIWI8C3LPMUK907ii9CSJzzUMzbX0AKg0=;
        b=SFzBJO87j+TWgbIBxXO2DYK7nRgGRvszp07uLIfxTN6E/RiHI5Vbu2/HrLHl1JNakg
         0ZrgoyzGl5tpex0J8Qft9YmrXn1fd/PwFBYCMtS+QV1Kx1yb8hWJxbNX+RgGTb6oUMdl
         3REqAnI+AAD9r7hhyzVjW0OC5v2y1OhIaUw+JW1iIgvMtcjURFsGZ2ESVrdIDf0mwkve
         mtZPqj+d3SQfihHpraH2qjUhE1Jn+UnHqga7Be3e1nE5wCYV/gK8+Bk3bmJEFeotURZP
         GhcN2shGLxLcq1RQY3rgilU9S8XKQC+K+Ls4uOBuCMA/zTraJu1RTyy5myGFbhlizMzm
         x71g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a4az9Nfw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y83si1634955yby.351.2020.08.26.01.06.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 01:06:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a4az9Nfw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAqSP-0002Kk-8W
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 04:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kAqRz-0001Sw-1z
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 04:06:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28403
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kAqRw-0004gK-BU
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 04:06:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598429187;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=eB8Jf216QnsIWI8C3LPMUK907ii9CSJzzUMzbX0AKg0=;
 b=a4az9NfwelYOYDGNZKfj65kvyqPyTblZbOqsBPcLwRoMcbHzGSyScMt58vxkYmBK2AApBt
 GprQnw3FTNCAWpW5G5pBjGvdmgWqOlnvTwUzZ9zj2E+f6r2VlZ9wrcBYzvHCu+ODAh7GD4
 vxeyCNmSEpK1MDxL+xiBq4xzigatmPs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-TW-DCVvCPK-6pkUY5C9gGg-1; Wed, 26 Aug 2020 04:06:24 -0400
X-MC-Unique: TW-DCVvCPK-6pkUY5C9gGg-1
Received: by mail-wr1-f69.google.com with SMTP id b8so238120wrr.2
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2020 01:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=eB8Jf216QnsIWI8C3LPMUK907ii9CSJzzUMzbX0AKg0=;
 b=k4L1erAkO6Afh/IjubpvexihZv5qCkJXtm6vbo7dQGwAbIFD+AtSNqIAQCMBMgKZpG
 l98oJQilTG8EHuLBfAr2gf8YoK7ImjPmeqA2v8y9XE0MFOTSz7n0y46N8A/mhnW/GMKB
 NsG41RWF79tRZmawJhELnO8d00RIXhOmA/eUAjCQ7v2gchv4BGVA+P+A9LkyKP2G/n3a
 e8K7g/rFxcHZPAb3wJUdnRcb4ntj87h6GRzfOB1c4/Zaq6bZMn/qTTF+7I4CElqpyVDz
 VcivBdDAdIWdjMJ76LL3UXjQYqfsyfoM8vbiGCCZJgTj/sBm0tznA4cLu3nZga6vmmgl
 cGUg==
X-Gm-Message-State: AOAM5335wUa1FS86JUT1emHqNFSnjN8oZiv38st5JqGYcGTg6hkFYOte
 TfXeS64Rb9IRYKTa9yghtKkI6dreBEvVckuVnrEn3eTKqVsEyI4njTBWRPFzkmyzfWjTP4uBUhe
 eCIXQzQfJM+CR
X-Received: by 2002:a5d:5712:: with SMTP id a18mr747575wrv.108.1598429182508; 
 Wed, 26 Aug 2020 01:06:22 -0700 (PDT)
X-Received: by 2002:a5d:5712:: with SMTP id a18mr747538wrv.108.1598429182240; 
 Wed, 26 Aug 2020 01:06:22 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id b8sm3916055wrx.76.2020.08.26.01.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 01:06:21 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v3 67/74] [automated] Use DECLARE_*CHECKER* macros (pass 2)
In-Reply-To: <20200825192110.3528606-68-ehabkost@redhat.com> (Eduardo
 Habkost's message of "Tue, 25 Aug 2020 15:21:03 -0400")
References: <20200825192110.3528606-1-ehabkost@redhat.com>
 <20200825192110.3528606-68-ehabkost@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Wed, 26 Aug 2020 10:06:20 +0200
Message-ID: <87k0xlygoz.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.120; envelope-from=quintela@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 01:10:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P.
 Berrange" <berrange@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p/ORZPhOjpRQ

Eduardo Habkost <ehabkost@redhat.com> wrote:
>  $ ./scripts/codeconverter/converter.py -i \
>    --pattern=TypeCheckMacro $(git grep -l '' -- '*.[ch]')
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

...

> diff --git a/migration/migration.h b/migration/migration.h
> index 4103e549bb..bdc7450da3 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -116,12 +116,8 @@ void fill_destination_postcopy_migration_info(MigrationInfo *info);
>  #define TYPE_MIGRATION "migration"
>  
>  typedef struct MigrationClass MigrationClass;
> -#define MIGRATION_OBJ_CLASS(klass) \
> -    OBJECT_CLASS_CHECK(MigrationClass, (klass), TYPE_MIGRATION)
> -#define MIGRATION_OBJ(obj) \
> -    OBJECT_CHECK(MigrationState, (obj), TYPE_MIGRATION)
> -#define MIGRATION_OBJ_GET_CLASS(obj) \
> -    OBJECT_GET_CLASS(MigrationClass, (obj), TYPE_MIGRATION)
> +DECLARE_OBJ_CHECKERS(MigrationState, MigrationClass,
> +                     MIGRATION_OBJ, TYPE_MIGRATION)
>  
>  struct MigrationClass {
>      /*< private >*/

Reviewed-by: Juan Quintela <quintela@redhat.com>

