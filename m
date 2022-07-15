Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp59722lfp;
        Fri, 15 Jul 2022 01:29:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s1BtCNFTM7jOZbcfyO6WMwrNze8zbTADBMrHZnBD363TA4xhHMru0ifjbmFkkWr2iwE6br
X-Received: by 2002:a05:6214:20a9:b0:473:6e47:956 with SMTP id 9-20020a05621420a900b004736e470956mr11069104qvd.31.1657873765673;
        Fri, 15 Jul 2022 01:29:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657873765; cv=none;
        d=google.com; s=arc-20160816;
        b=dhdH32opz7bGoUL0ISOQcBKZWKM+daM0BtTMwOagS7zsL422bxygfNALXTEhDi7Wg2
         NhrZYQCCBVTMRitNR8tMyb5LeSpSdxUw3Bq/4j1yvvO3bvioSO6O7Irk7VYmAKPPMv9n
         1eF26i9m5TiOD4xHQaEAqQbWfM2iv9jS4t4u+dNcPueSDXYbwhPGl+nv33s/PR3CgXso
         WSip/tZdoLeB2w2rv1AJbLUs0tPgzXcnHXdH8pdJEmccegVHg+sk2aK4TPHxlYgxqvLq
         Z3iLfywQ7SfxpRBGjmkIVcyHyOEdkCIHH/tnGVL7ExiRH1faqBstOPz/W0p7DNVm6490
         S7+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=Cx0I3ThQ8ipnE8Y+qblNRLmVYbCja5pWR7v8MFyQnis=;
        b=JebSOCbxVuSjMacMMJ547nMRv1n6Hg3oEobFKySESHFQAndZP96RenRP4fCyN4RiYe
         ucshLD1NjRJfzYlJQbnQUDAJGjjqBEwaW+ZKj1ML0wicRAy/0zK0+LuuhciApBS0acRe
         90ONYR1RtliPA90dyMUGmbT4llKu/d5QEyMZfHDEEkyGb8/nXDBuv5LD3O7zYg2GWUaQ
         1dlI8Aq52I67e3IF0WNFs3wmEihgGswMRDQcIEQxNuSqBqNnculmQvj57u2eQ7aUgeCI
         OIsIOuBNkVY9981v621vYnzOcKOkcOXNXoEYLKv7xO6ZzwDgmxhuUNQtgpyoP+bhKkkk
         2DIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PQIY0cbq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if13-20020a0562141c4d00b004702e734bd7si2458267qvb.439.2022.07.15.01.29.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jul 2022 01:29:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PQIY0cbq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oCGhR-0001qX-5V
	for alex.bennee@linaro.org; Fri, 15 Jul 2022 04:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oCGgy-0001Me-1r
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 04:28:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oCGgw-00021y-JW
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 04:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657873734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cx0I3ThQ8ipnE8Y+qblNRLmVYbCja5pWR7v8MFyQnis=;
 b=PQIY0cbqOStnpSZp9rSmdyDxUcd4/AJTTPHHsyT0IUxJZG0ZbUPy4AnxrOJOldeeVqvf60
 d2ZSthzn6xPO9ZvN9Vk7MYptg23+SYWZTBB3XcLXtywmJeWYs+BQ8F7ZNYH1Wpvr3luhRb
 i6pEt0njecHr4D++EK6j2Jw9smBoXlE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-nEfZnabUM42Jsh6Sg596Lw-1; Fri, 15 Jul 2022 04:28:37 -0400
X-MC-Unique: nEfZnabUM42Jsh6Sg596Lw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A571B802D2C;
 Fri, 15 Jul 2022 08:28:36 +0000 (UTC)
Received: from localhost (dhcp-192-213.str.redhat.com [10.33.192.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 674F1C1D3AD;
 Fri, 15 Jul 2022 08:28:36 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, David Hildenbrand <david@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH 1/3] target/i386: display deprecation note in '-cpu help'
In-Reply-To: <20220714150735.1835166-2-berrange@redhat.com>
Organization: Red Hat GmbH
References: <20220714150735.1835166-1-berrange@redhat.com>
 <20220714150735.1835166-2-berrange@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Fri, 15 Jul 2022 10:28:35 +0200
Message-ID: <87y1wu3hl8.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: bYctSU1Ar58d

On Thu, Jul 14 2022, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> The deprecation notes are currently only displayed at runtime when the
> user activates a CPU. The QMP query displays a simple flag for
> deprecation, while '-cpu help' displays nothing unless the deprecation
> info is duplicated into the 'notes' field.
>
> This changes the code so that deprecation notes are explicitly shown
> in '-cpu help', to assist the user in deciding what to use.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  target/i386/cpu.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

