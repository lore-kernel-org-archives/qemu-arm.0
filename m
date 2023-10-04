Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2843556ejb;
        Wed, 4 Oct 2023 11:16:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJDMnWVFKqcc3d68o04GJCjI1tW3Hwjy9OG/eA6f3em0Ezuzm0R5EIIsLEut6Y9WOhsnCV
X-Received: by 2002:a05:6214:aa1:b0:65b:748:cddd with SMTP id ew1-20020a0562140aa100b0065b0748cdddmr2634448qvb.29.1696443363189;
        Wed, 04 Oct 2023 11:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696443363; cv=none;
        d=google.com; s=arc-20160816;
        b=B7v9aaJydOfuwUw5rIMk/yFKIpJdZFVnop6dcWATUGTwrkFrvOmflpCGXcY7mkMteB
         9eJUqjeCAatsmlgyUCEtL+DBdSji5fouCWMtXOACPt3hH5pm0sb8b51oRaJa5SOKjJs+
         Mlt8BxPiu+LOFRAt1Y2/KkfcpplEQN9clROzrs0tukbpUKWXNbi7vdq/U1RWpeR1gXD4
         Es3GUtCzI14se5BqNv2kytjUMYj6ysVKl5qWLXBhla/SMcrRWCt2Cn2VGmGNjK96Y/rK
         vqysP/1jnSV7RcjE/SUMMWr341qcQqKq1dPw64EIQnuBJ33S+TQKXG20C5exqfUhxY1+
         VYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=5GimX+cA1aKh/KM4sS+CQCOjohDRkBYnOfoOQOGJfBo=;
        fh=3W/lP/1Eu+evr1r3lpT+1OeoY9hw32uBLDaNbLAPmrE=;
        b=mQJx6XlXEIR1Ys3nWp0SbEKv/LBNipsZ0TaYKZn4UFOkhe4pESLJKuVen8Wd1IP1I0
         q1CVqVTxgkXKybvznOURlWhhcJ6Rwqgq7VWw3igA591eSPtej4HyfqplSx5tZDzZeFUS
         1qTW/AA8kwUObJoaMQhkx781vmH0ThoJsRDG33r7WIFQQ7tF0O/9Pg/CKxnL14QcswuV
         lZ960KFV7S4RYJqnO/Eq/LdlCwAZ8j8Oh+GDkSdUK8bLFGiDFPbJZS/WCNyd0g5wX984
         Errave51/WREo497sGui7mMvfYDnzvIvRw7/ye2HaWF+fEJL+zEG2DLXEc/BGvlY7A/h
         eHlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KuFj5Qv3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18-20020a0ce3d2000000b0065d009ecc5bsi1703884qvl.241.2023.10.04.11.16.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 11:16:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KuFj5Qv3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qo6PR-0006tb-8t; Wed, 04 Oct 2023 14:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qo6P8-0006ki-9f
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 14:15:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qo6P4-0007t5-S2
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 14:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696443317;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5GimX+cA1aKh/KM4sS+CQCOjohDRkBYnOfoOQOGJfBo=;
 b=KuFj5Qv3RmrAv6wUMm13ERwJGPESg7dp6HgWThrV5PJve7oZUbsa3K4J812O0ztndzFBKs
 Gt1OEYxBV1Xyc0tMw8FRMuecYu+cfUzymHDyt1L9qEPOFogUu56biMDN/jGXjbDn/0mUBK
 C9k0Qh+LH8nc/+OyQYJ53pNU3NiqYik=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-7tPCOZbNNZiuX1tDje6gyQ-1; Wed, 04 Oct 2023 14:15:15 -0400
X-MC-Unique: 7tPCOZbNNZiuX1tDje6gyQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-32661ca30d9so105027f8f.0
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 11:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696443315; x=1697048115;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5GimX+cA1aKh/KM4sS+CQCOjohDRkBYnOfoOQOGJfBo=;
 b=mJON1hr+xQs/Dv6/srkKYEWrVSYqZEUX4yzNcvuxvF4BP/d5IHPQ2b1Q2YTFaWIooi
 fCUwrVvjfttqPhDOMpWQSPlhFiB1OSKHdP0BkYKshST4KfOvGPqEbwcyRWQ/09cAtt73
 IfgTsUUJ+RbXk4tnusEvi03q8ZmJQDNZn2v2MfY9UcjBeD/W6rMzcFLo8BT4uiJAYA8M
 zvlHsPnoQPa4+xHCzwZGU1SlvIDG2luy41SYniXYWpfO9/WYNSYNaYzsTfJKDZknV9Me
 LazeOsX9ViOiBW5Zgsvq6SKrJazWbRwzNVHAU34YnMmdOcI458VpnkmxPpiTOvF6Faos
 tYiA==
X-Gm-Message-State: AOJu0Yy++4RAzNoMCKIQ0p5rFBJXPKKGaN+StbeJ/YzwtGz5QbT8CTjg
 f8TBr01VwenBKFsGZml7JeXjwsM8QxxOHdPEuabQ1mFEvvBtk2IB5kJd0IoFXyFvjwAVRjFJRcw
 TW9gM63JfMzk3
X-Received: by 2002:a5d:6445:0:b0:322:6201:6049 with SMTP id
 d5-20020a5d6445000000b0032262016049mr2611790wrw.39.1696443314895; 
 Wed, 04 Oct 2023 11:15:14 -0700 (PDT)
X-Received: by 2002:a5d:6445:0:b0:322:6201:6049 with SMTP id
 d5-20020a5d6445000000b0032262016049mr2611774wrw.39.1696443314563; 
 Wed, 04 Oct 2023 11:15:14 -0700 (PDT)
Received: from redhat.com (static-151-150-85-188.ipcom.comunitel.net.
 [188.85.150.151]) by smtp.gmail.com with ESMTPSA id
 e6-20020adfef06000000b003197b85bad2sm4579623wro.79.2023.10.04.11.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 11:15:13 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,  "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhenwei Pi <pizhenwei@bytedance.com>,  Laurent Vivier
 <lvivier@redhat.com>,  Amit Shah <amit@kernel.org>,  Alberto Garcia
 <berto@igalia.com>,  Kevin Wolf <kwolf@redhat.com>,  Hanna Reitz
 <hreitz@redhat.com>,  John Snow <jsnow@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  =?utf-8?Q?Marc-Andr?=
 =?utf-8?Q?=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Peter Xu <peterx@redhat.com>,  Leonardo
 Bras <leobras@redhat.com>,  Jason Wang <jasowang@redhat.com>,  Konstantin
 Kostiuk <kkostiuk@redhat.com>,  Michael Roth <michael.roth@amd.com>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>,  "Michael S. Tsirkin" <mst@redhat.com>,  David
 Hildenbrand <david@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH 10/21] qapi: Inline QERR_INVALID_PARAMETER_VALUE
 definition (constant value)
In-Reply-To: <20231004173158.42591-11-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 4 Oct 2023 19:31:45
 +0200")
References: <20231004173158.42591-1-philmd@linaro.org>
 <20231004173158.42591-11-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Date: Wed, 04 Oct 2023 20:15:12 +0200
Message-ID: <871qeas18v.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ijVpLi9hi2m3

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> Address the comment added in commit 4629ed1e98
> ("qerror: Finally unused, clean up"), from 2015:
>
>   /*
>    * These macros will go away, please don't use
>    * in new code, and do not add new ones!
>    */
>
> Mechanical transformation using the following
> coccinelle semantic patch:
>
>     @match@
>     expression errp;
>     constant param;
>     constant value;
>     @@
>          error_setg(errp, QERR_INVALID_PARAMETER_VALUE, param, value);
>
>     @script:python strformat depends on match@
>     param << match.param;
>     value << match.value;
>     fixedfmt; // new var
>     @@
>     fixedfmt =3D "\"Parameter '%s' expects %s\"" % (param[1:-1], value[1:=
-1])
>     coccinelle.fixedfmt =3D cocci.make_ident(fixedfmt)
>
>     @replace@
>     expression match.errp;
>     constant match.param;
>     constant match.value;
>     identifier strformat.fixedfmt;
>     @@
>     -    error_setg(errp, QERR_INVALID_PARAMETER_VALUE, param, value);
>     +    error_setg(errp, fixedfmt);
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

And like the approach, but=20

>      if (granularity !=3D 0 && (granularity < 512 || granularity > 104857=
6 * 64)) {
> -        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "granularity",
> -                   "a value in range [512B, 64MB]");
> +        error_setg(errp,
> +                   "Parameter 'granularity' expects a value in range [51=
2B, 64MB]");
>          return;

There are several lines like this one that become way bigger than 80
characters.

Later, Juan.

PD.  No, I have no clue about how to convince coccinelle to obey qemu
     indentation rules.

