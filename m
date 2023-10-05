Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp254960ejc;
        Thu, 5 Oct 2023 04:58:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGw81kDQRPDYcfpgPwyP0rs9KmrJ6NsfhhYUkpZjOiGXBzbGMu7yZ0rwOqFnm7+Dm052xMb
X-Received: by 2002:ac8:5956:0:b0:418:1a69:562f with SMTP id 22-20020ac85956000000b004181a69562fmr1385068qtz.24.1696507097200;
        Thu, 05 Oct 2023 04:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696507097; cv=none;
        d=google.com; s=arc-20160816;
        b=BofQ/nrzn+luvdXiOAv7PVeIDlYGBym4PdjHg9IKjJwUhuTCeZS0tcVQvbwB9d/Ii6
         hlsKOr5Bx4vZC7boDAzIxTZs3OaAVS3/UV2HVbmOhcMFO3W54FflEujPg6fIlk7KQAg8
         kfo9ldAooDYIbmbssb4E4m+m3mhNQovX8riU+MTWsNRef4ZjwM90HEJTTewBa5/Qn0NF
         uDHJz8wWqudMQUW2KdHOrGC2SbRLYiQb+VoZYLbO2MnZwL/4epM1xKHTFgNzKiZJYltx
         yEBdAzPG6+3m3LPWZ7xhhSPakzjuGNoTD80J9fzygKLK3tvfzXXQxylh/spMy0hoN8kw
         PccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=t/xveGZJAAAhSaJXa4FO3Ds6qNdXzBHo0pQeI/cBcvM=;
        fh=yCkzfkAvc2cUmqLMqwbvBWHBWlv+HkKDJQFamiYZpp4=;
        b=Nf5FMZRpFd3Y9iAaXXXllaobykY/yHtWdJNUW40uGbUu0QWKMlbnMVsWdqW+7NrNpz
         g9ugYeBu3+fng9zaFvPCqe+e8a2MNJl8+7PSht/NhV/IpAB4KVerRUpTn/junTM1X/dY
         688K4N1QLBgMnq48zt6qrUIV2vet5j2nADdE57dWgt+0L8of80K+U/g2602N0fQv2OKa
         60/KMQnbIuWEGdSjHnaV/LhyNq9dQEUPCsqiaVFPJY8kxTDh8yQGEFaYqaFT+mORze/h
         TcqnTKOBY5OPsjEnGyOZZcOoHHln+IoVAboNfAfJz6w98tyL33ompz3uJ95v8eTBx25v
         DRrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="g/2E1cYV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11-20020a05622a190b00b0041954258c3fsi754171qtc.557.2023.10.05.04.58.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Oct 2023 04:58:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="g/2E1cYV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qoMzC-0005nn-F7; Thu, 05 Oct 2023 07:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qoMzB-0005mt-Bm
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 07:57:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qoMz9-0002kL-Pn
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 07:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696507063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t/xveGZJAAAhSaJXa4FO3Ds6qNdXzBHo0pQeI/cBcvM=;
 b=g/2E1cYV99f5gYlUF9iPs/Kg7oUz7c4lliqXIWMUva75D8bYDAIqyOIUMYW6hKFpFeP7Xa
 qabTEXB9SfRQY4ooSuFNwP4DnNUZH/AHSXLgckQqASQbRqQLys1WIzihRAK/vpb1WWmm4t
 7U5VMSgLITzYdUIG0pFOD8pW3doKWAk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-2GgeK6JCPQmdtypgMqJptA-1; Thu, 05 Oct 2023 07:57:39 -0400
X-MC-Unique: 2GgeK6JCPQmdtypgMqJptA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC817811E7B;
 Thu,  5 Oct 2023 11:57:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8877C2026D68;
 Thu,  5 Oct 2023 11:57:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8594D21E6904; Thu,  5 Oct 2023 13:57:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,  qemu-block@nongnu.org,
 qemu-s390x@nongnu.org,  Michael Roth <michael.roth@amd.com>,  Konstantin
 Kostiuk <kkostiuk@redhat.com>
Subject: Re: [RFC PATCH v2 21/22] qapi: Inline and remove QERR_UNSUPPORTED
 definition
References: <20231005045041.52649-1-philmd@linaro.org>
 <20231005045041.52649-22-philmd@linaro.org>
 <87mswx5n63.fsf@pond.sub.org>
Date: Thu, 05 Oct 2023 13:57:37 +0200
In-Reply-To: <87mswx5n63.fsf@pond.sub.org> (Markus Armbruster's message of
 "Thu, 05 Oct 2023 13:22:28 +0200")
Message-ID: <87h6n546z2.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
X-TUID: f937zc6eYG3V

Please ignore this copy, it has the recipients messed up.

