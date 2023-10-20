Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1202191ejb;
        Fri, 20 Oct 2023 06:01:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnnsis5JMELNoQc4a24Pj4fU9NrJLZ3ZMVO7FTvHp4Gg0sX37mQUiCEPWPywAzNgjs41s+
X-Received: by 2002:a05:622a:83:b0:418:110e:6179 with SMTP id o3-20020a05622a008300b00418110e6179mr1901964qtw.1.1697806905702;
        Fri, 20 Oct 2023 06:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697806905; cv=none;
        d=google.com; s=arc-20160816;
        b=BefxyrJQCpID2GPIDny6hb/Cm/4qtOQ0Ps3n/qrKDqVDLx1YLu2hDgit0ZZr0V/bAV
         9ylkCAoNG41ZXM8dbkZfvtL0dacelPjPT+8L5f1N0MKwax3BhfDWT47t7e46Fwc2Qfhk
         KZ5VlsC4DAyWzSKTBtHhsUfTXWheouZZbMutfIzK0pOQHBpeJY72maqIKmfIO4myO/vf
         hddCR2VtLa30VsecFjpm+ScjEsUVz+8JarU1K5maF5rjMV66ReLHUeP1QqD98DnsYjeA
         4R07II6GP9DJLaj9fxv8uzNwOtRJQ1iVwq4iIoKUrLWNll+xlNPQx4V1+o85t+mHhgvV
         29Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=NJIySRtNCp38Hmx09wCIFor1YWd+eY+vcX31qBpyLp0=;
        fh=zHfY8KAoauwEwx5o+zV6auAVEEWPoVoOF++671gHINg=;
        b=xmZRfnjMdvkN72G775OBHi5SsJFfr39R9AtMH+5VypKi1zD4lOrrssUGmtUE3t0VaZ
         WD8Z/jaBddqlaoPRYei3A8wGAFHnzHyoCyQq0YY3QWr9E/fqDulimwNNjyj1SCvzOjUp
         skviQVcqJT8Bq8vhhwEtcMGAWDwxFH4ZzpgLt5XEg9isYvfBeeSN+ZaBlXz/FUW0mpFq
         V6r3+bA+Te9UujUZBahia2iGYKZSTqHhXb7klaFCGSBIYRfosl+lQQySiPibmWvHpwo1
         C9AbmX+iVM8NjQqiCMt3Al27sUmfHibz/4mB97rJPIJuaD1AX0cksiRSG3oh8hwZBkkw
         sPfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YT7dZ040;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12-20020ac85dcc000000b0041cc00fc0a4si1260255qtx.218.2023.10.20.06.01.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 06:01:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YT7dZ040;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtp87-0006Mf-Q7; Fri, 20 Oct 2023 09:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qtp7K-000642-B1
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 09:00:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qtp7H-0004Tl-Iw
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 09:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697806836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NJIySRtNCp38Hmx09wCIFor1YWd+eY+vcX31qBpyLp0=;
 b=YT7dZ040Tk35r10Jv6nlmv7UKpvbJGon3tq5kxpKTb8/lpMBiOWWuG2hVB+JGxe+1hnYMK
 imkSXfbraV8USz26gYExD3ZDsLvhFzRmdQyo+RIYO6m5rJ61IYwabl4T0/mCkmvijcpZPB
 Y1kn3cAGk606LCQP17VgihPZs+Z/N4c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-D872OM3kM-2XaiD9O6Aqbg-1; Fri, 20 Oct 2023 09:00:25 -0400
X-MC-Unique: D872OM3kM-2XaiD9O6Aqbg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 904BF81156E;
 Fri, 20 Oct 2023 13:00:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D1861C060B1;
 Fri, 20 Oct 2023 13:00:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 807B021E6A1F; Fri, 20 Oct 2023 15:00:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,  qemu-block@nongnu.org,
 qemu-s390x@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>
Subject: Re: [PATCH v2 18/22] qapi: Inline and remove
 QERR_PROPERTY_VALUE_BAD definition
References: <20231005045041.52649-1-philmd@linaro.org>
 <20231005045041.52649-19-philmd@linaro.org>
Date: Fri, 20 Oct 2023 15:00:23 +0200
In-Reply-To: <20231005045041.52649-19-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 5 Oct 2023 06:50:35
 +0200")
Message-ID: <87bkct1mag.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
X-TUID: 6On2vJMVBapa

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Address the comment added in commit 4629ed1e98
> ("qerror: Finally unused, clean up"), from 2015:
>
>   /*
>    * These macros will go away, please don't use
>    * in new code, and do not add new ones!
>    */
>
> Manual change. Remove the definition in
> include/qapi/qmp/qerror.h.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  include/qapi/qmp/qerror.h | 3 ---
>  hw/core/qdev-properties.c | 2 +-
>  target/i386/cpu.c         | 2 +-
>  3 files changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
> index b0f48f22fe..7862ac55a1 100644
> --- a/include/qapi/qmp/qerror.h
> +++ b/include/qapi/qmp/qerror.h
> @@ -17,9 +17,6 @@
>   * add new ones!
>   */
>=20=20
> -#define QERR_PROPERTY_VALUE_BAD \
> -    "Property '%s.%s' doesn't take value '%s'"
> -
>  #define QERR_PROPERTY_VALUE_OUT_OF_RANGE \
>      "Property %s.%s doesn't take value %" PRId64 " (minimum: %" PRId64 "=
, maximum: %" PRId64 ")"
>=20=20
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 357b8761b5..44fc1686e0 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -682,7 +682,7 @@ void error_set_from_qdev_prop_error(Error **errp, int=
 ret, Object *obj,
>          break;
>      default:
>      case -EINVAL:
> -        error_setg(errp, QERR_PROPERTY_VALUE_BAD,
> +        error_setg(errp, "Property '%s.%s' doesn't take value '%s'",
>                     object_get_typename(obj), name, value);
>          break;
>      case -ENOENT:
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ed72883bf3..e5a14885ed 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5190,7 +5190,7 @@ static void x86_cpuid_set_vendor(Object *obj, const=
 char *value,
>      int i;
>=20=20
>      if (strlen(value) !=3D CPUID_VENDOR_SZ) {
> -        error_setg(errp, QERR_PROPERTY_VALUE_BAD, "", "vendor", value);

Reporting the actual problem would be better: we need the value to be
exactly CPUID_VENDOR_SZ characters long.

> +        error_setg(errp, "Property 'vendor' doesn't take value '%s'", va=
lue);
>          return;
>      }

