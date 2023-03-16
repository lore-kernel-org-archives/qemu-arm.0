Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp176631ejb;
        Thu, 16 Mar 2023 04:11:49 -0700 (PDT)
X-Google-Smtp-Source: AK7set8B2ixngdrEkpdVlEyC7w7YtbikWwIswD8vbYvJ+SIWkovPztoTYCHhMZMIILo3LpQxrT/4
X-Received: by 2002:a05:622a:19a6:b0:3d7:dfb7:a7fa with SMTP id u38-20020a05622a19a600b003d7dfb7a7famr2988206qtc.21.1678965109444;
        Thu, 16 Mar 2023 04:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678965109; cv=none;
        d=google.com; s=arc-20160816;
        b=iYaeBK+K+UvzF2vI2a8W5niZZ08bHGYFx8ZFKakcqPY0sUMVlclWF0AODYEhcU58Ht
         SePoY93Mh3tMZrONv2TS1ZClYqiqRhE2UUwebsMNq+AU80VOF3fubo0wC1AEnjnFu12I
         pqBkqLa+ASK3ywqK4waq8McmT4YvQXlok5wvxXdpzp47mKKe1Qnge8VDMplvxr0GaY6G
         QQnvzldhZN3jWFPXvswKSoNFIwTdvVPXfOfnlJAJpX5F/6SQnaL4X+XMcGt8XnJf8nmr
         LDQ7XV9dQNL67PSpxxshSEkRBWqtH/MbmAyMQ+mhIBplWywujLexeTX4mzjRnWFiGjcz
         21bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:to:from
         :dkim-signature;
        bh=TLGVNfmXJ9FDHlv3EKjAeCupIl0pZdR+fA40ANpVWJg=;
        b=Ebx1RLAmju+8BoDhS7owp0C/AHBddsIVJVhSLZRC+jubPpx3HCRtjCk9ryZ+3/rBYW
         mKqJIalDJPddbaq5MrG0uIxaEsxpvtvp6SEFCq0gBvRDfMVyudrwQltKAdW+IOYqj/vD
         CrbEFYXh+sSXwzie7AjWzPuIQc6B7th+Tzu1LHy280zedsYYe4fhGDZlOLzZyPiVhECP
         i+r1nTQWLyWg4gk3Oxn9LF+Cb7GkG2beLOA/717pQRCrxTQ0LD2xGsWslqAYIzuDhKCl
         S2Ab3lL3r2xkZUtBBwS4DRKchGDaHIjGZbSRqpxEy4Z6/X84azmI/tqSJLuxkKHUVQqv
         7wUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B9znd3KR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 125-20020a370683000000b0071ab9598fd0si6231689qkg.330.2023.03.16.04.11.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Mar 2023 04:11:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B9znd3KR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pclVz-00053z-9U; Thu, 16 Mar 2023 07:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pclVu-00052l-Qn
 for qemu-arm@nongnu.org; Thu, 16 Mar 2023 07:11:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pclVn-0004wf-Ii
 for qemu-arm@nongnu.org; Thu, 16 Mar 2023 07:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678965069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TLGVNfmXJ9FDHlv3EKjAeCupIl0pZdR+fA40ANpVWJg=;
 b=B9znd3KRLfw2c3KN7FGytq5i6wboPzIQ6rBNOEkTZGnnM6nouHMh68/U6WzxKN89oriFaq
 2fo8B5W9tyhx2W3h8rc8nMrPvcCLYXmGgztYNPtpntT8D9PrbjK1vmA57Zy+pGGfqcBdQJ
 g1kY4RVCuQE08mBhK68RUHT8XIQz8cQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-NaPBLgXLPJK08RSTx5XkCg-1; Thu, 16 Mar 2023 07:11:07 -0400
X-MC-Unique: NaPBLgXLPJK08RSTx5XkCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66408858F0E;
 Thu, 16 Mar 2023 11:11:07 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E223202701E;
 Thu, 16 Mar 2023 11:11:06 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH for-8.0] docs/system/arm/cpu-features.rst: Fix formatting
In-Reply-To: <20230316105808.1414003-1-peter.maydell@linaro.org>
Organization: Red Hat GmbH
References: <20230316105808.1414003-1-peter.maydell@linaro.org>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Thu, 16 Mar 2023 12:11:05 +0100
Message-ID: <87h6ul0x4m.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: XTO+tEskIhfS

On Thu, Mar 16 2023, Peter Maydell <peter.maydell@linaro.org> wrote:

> The markup for the Arm CPU feature documentation is incorrect,
> and results in the HTML not rendering correctly -- the first
> line of each description is rendered in boldface as if it
> were part of the option name.
>
> Reformat to match the styling used in cpu-models-x86.rst.inc.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1479
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/cpu-features.rst | 68 ++++++++++++++------------------
>  1 file changed, 30 insertions(+), 38 deletions(-)

(...)

> @@ -217,16 +210,15 @@ TCG VCPU Features
>  TCG VCPU features are CPU features that are specific to TCG.
>  Below is the list of TCG VCPU features and their descriptions.
>  
> -  pauth-impdef             When ``FEAT_Pauth`` is enabled, either the
> -                           *impdef* (Implementation Defined) algorithm
> -                           is enabled or the *architected* QARMA algorithm
> -                           is enabled.  By default the impdef algorithm
> -                           is disabled, and QARMA is enabled.
> +``pauth-impdef``
> +  When ``FEAT_Pauth`` is enabled, either the *impdef* (Implementation
> +  Defined) algorithm is enabled or the *architected* QARMA algorithm
> +  is enabled.  By default the impdef algorithm is disabled, and QARMA
> +  is enabled.
>  
> -                           The architected QARMA algorithm has good
> -                           cryptographic properties, but can be quite slow
> -                           to emulate.  The impdef algorithm used by QEMU
> -                           is non-cryptographic but significantly faster.
> +  The architected QARMA algorithm has good ryptographic properties,

You dropped a 'c' here ----------------------^

> +  but can be quite slow to emulate.  The impdef algorithm used by QEMU
> +  is non-cryptographic but significantly faster.
>  
>  SVE CPU Properties
>  ==================

