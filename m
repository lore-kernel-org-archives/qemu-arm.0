Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp368727lfp;
        Fri, 22 Jul 2022 08:37:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vRe+sg+DIksCBrIlDw6IRPT4gjBBBtHzmTl06BX1K1ZTcLf21QCtMvZHKyG7RzvtNGJw46
X-Received: by 2002:a05:620a:c52:b0:6b5:467f:4f6d with SMTP id u18-20020a05620a0c5200b006b5467f4f6dmr353953qki.503.1658504271046;
        Fri, 22 Jul 2022 08:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658504271; cv=none;
        d=google.com; s=arc-20160816;
        b=LLK/H1wxiJF1bpYn5uQqV+PrE5STyT3FfO0+hZUzVS7xmU+Tn/DwvRh35+RA9ybDd3
         troGulNf+fjL8z4v9po3YEdsEEhmtVKkyQW47XXjZtuGb/GENdyVa/usC1nz06cPAKrP
         TRA4Gw3+1Js6YO7pzGz54a2hx/sZY+5ayvjzBKa8KV6WI4PpEyeukmo7ealzTZhiE7S8
         w/+sdVIMMOY1gPUxsfH3Nm4BAKVbjd3Ysd0BoJxDkPqG+FjAgGF/k/29mIUd5rJCAfr6
         +qeNFb6KVKKrHbxfp++qk8OVZDcJ5HNOFyI6XvcCRQNcdBXRojNFiPCQVCRptFhUk+/Z
         jpmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=4K4mlR0jd7r8tM//dO5rJePxti7I5+cJYTe48h5NFzE=;
        b=M1jgqpCKukvg3Cv3thM4uLegdtYY2wuKf8OZ5EJBU028a3okuo2KswpEK2QiKUKvGa
         tIyjRaZBp2JtJxp1ZFyzIUPprfOJCYF/Q5Q8lwCwJ+vCt5XcvObyxuoncbNrfGruGfph
         7ktdj9+mFzdvSlrcu1utBKdGL2QkCJLOGESAty5eBDYY873Rrph1OMPpJnR4U+Qgr2de
         BJRPgvJSqmzR2YKACpvR0IsZgZa0FbWIUVGDieEbKMoY2+7f45Nac7UpFlmiPTS2YZs2
         sm4Og3vNTg2rwxx+SySeyBdg4pjABwXFOLxZtLXY2WKvxgAZmu1Vx6hgaBDzbAKp3X85
         46bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dtwF97au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7-20020a05620a254700b006b552103d24si3656365qko.106.2022.07.22.08.37.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jul 2022 08:37:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dtwF97au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEuis-00021R-It
	for alex.bennee@linaro.org; Fri, 22 Jul 2022 11:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oEuib-0001yZ-T9
 for qemu-arm@nongnu.org; Fri, 22 Jul 2022 11:37:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oEuiY-00048h-V8
 for qemu-arm@nongnu.org; Fri, 22 Jul 2022 11:37:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658504249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4K4mlR0jd7r8tM//dO5rJePxti7I5+cJYTe48h5NFzE=;
 b=dtwF97auvR31oxQhsM/7dOpysIvtB4pgXRXn/o89066ldeYiVshNsmKfPZG/Qfc9M9qs+F
 VVlAQrvAKd/n7OdK64W/opLww6hkgAXmFfU+q8oP9c7LyfIBUX9yT7EuIgKHxnvYUv6H7k
 un3+BnQkBFt9EqUDpz4XD83XkSpPt/0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-FK8MKfYPNZqjvvREGyGWbw-1; Fri, 22 Jul 2022 11:36:52 -0400
X-MC-Unique: FK8MKfYPNZqjvvREGyGWbw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F5F438009E1;
 Fri, 22 Jul 2022 15:36:52 +0000 (UTC)
Received: from localhost (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C58A0492C3B;
 Fri, 22 Jul 2022 15:36:51 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org, =?utf-8?Q?Dani?=
 =?utf-8?Q?el_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 1/3] target/i386: display deprecation status in '-cpu
 help'
In-Reply-To: <20220722120224.2311982-2-berrange@redhat.com>
Organization: Red Hat GmbH
References: <20220722120224.2311982-1-berrange@redhat.com>
 <20220722120224.2311982-2-berrange@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Fri, 22 Jul 2022 17:36:50 +0200
Message-ID: <8735etnoq5.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wnldIDrInEyS

On Fri, Jul 22 2022, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> When the user queries CPU models via QMP there is a 'deprecated' flag
> present, however, this is not done for the CLI '-cpu help' command.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  target/i386/cpu.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

