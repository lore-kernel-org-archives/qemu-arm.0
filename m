Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp288392ejc;
        Mon, 25 Sep 2023 03:49:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPWiOq4+5PLt3QQXdSY3C8WA6RCVmMhqZc0DYuWbzgwWAKbLbWvshvTQRD4YPPPHkUR9Q1
X-Received: by 2002:a05:620a:2494:b0:770:72c3:dbbc with SMTP id i20-20020a05620a249400b0077072c3dbbcmr7089984qkn.18.1695638942027;
        Mon, 25 Sep 2023 03:49:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695638942; cv=none;
        d=google.com; s=arc-20160816;
        b=Ei+A9GTzxMCN1i9N3zgUVgGx5Lee2k4/7OUEf0PwokoPKbo4iDroMkAp6SMbgjcbfQ
         nk2Pum++y6G/0Rm4BHLQmmuOkorHWtB8mtQkXE0ykr5DOaA5GkOfw9OeQquSMBlJkf/r
         w6ytjbVZcKvvZrmW2L0NKGXqvO9kSmRo6bRkUj6fv9KMaRuhlDL49S2zyTow2e7F5iZK
         wE8J7cU35y/7VnLgg8r0qFRScn4vIVGGBvyDhlCqmfsqts+MmTsZGu5sRiZLG2oS8uBP
         cKDIatfZYjSwq6GnIdibXvnhvJXRP6qiGHkzVe0ZlQNAAoV7dW5jT4ufbAhsknvqMU8P
         epxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=kva2otVOD2n08s9nh07oNxB9XL90qrohICpSblXC4CI=;
        fh=PvAEmqgxX943Kfka26fmozW/r1QCzseN2ZKHDbLvvrg=;
        b=HlkQq34CJZ+lIZHyUbPqP5nPIKTDW+97ZbZ2gQJ6F6rZITmk0SV22QntuhPfkVubIn
         gJAvy1l8WAPB8RPDdEA54DbTG1NouqYHhso4/x5GOILAPJS8FqnnewvBxNmseSMgeUIv
         JrpHfKfSm/T7+Asq+72kRkx1dnOGBYe+eMfWAeb3ACJvkkzVQCHmbNPozMEAd0ME43LG
         sFjWjcT/ozkzd/MLpMB4K4F5kSM2vrRZVd1azLXymnV8v6zo+I4eQhNM5yr/f260cnN5
         pymquReaBKf21tUXhqo5KBJvUePz5LhMlcZg++L7njLMPe9vPM4eJmFBKXIqJDdyIbgl
         Sqhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LZP4uQFm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9-20020a05620a25c900b0077263dd03f3si6188851qko.33.2023.09.25.03.49.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Sep 2023 03:49:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LZP4uQFm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qkj8n-0007xx-I9; Mon, 25 Sep 2023 06:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkj8l-0007xR-9r
 for qemu-arm@nongnu.org; Mon, 25 Sep 2023 06:48:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkj8j-0005Mb-MT
 for qemu-arm@nongnu.org; Mon, 25 Sep 2023 06:48:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695638913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kva2otVOD2n08s9nh07oNxB9XL90qrohICpSblXC4CI=;
 b=LZP4uQFm3YXyEfOPHx+25qZGvACBWxNaLFOPQVNMCYnTN0sugelUz+u7apvE+wUmroDQX/
 S7KMY9yzv0/kDHIwBA5DCNWBWDM0Z6+42fGAhg0e13IBANft6aFWXdfStC/VkAXWOos1AM
 uLjz/Pvjj/LDUvsU0n+Jb26idGq5bFs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-pB7qsNGnPbi0--glqrjfLw-1; Mon, 25 Sep 2023 06:48:29 -0400
X-MC-Unique: pB7qsNGnPbi0--glqrjfLw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5693C1C07580;
 Mon, 25 Sep 2023 10:48:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 337CE40C2064;
 Mon, 25 Sep 2023 10:48:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 246F621E6900; Mon, 25 Sep 2023 12:48:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,  Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 13/15] hw/qdev: Remove DEFINE_PROP_DMAADDR() and
 'hw/qdev-dma.h'
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-14-philmd@linaro.org>
Date: Mon, 25 Sep 2023 12:48:28 +0200
In-Reply-To: <20230203145536.17585-14-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 3 Feb 2023 15:55:34
 +0100")
Message-ID: <87zg1a8r5v.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 7lrmKOfyxZUj

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> DEFINE_PROP_DMAADDR() is only used once. Since it doesn't
> add much value, simply remove it, along with the header
> defining it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

DEFINE_PROP_DMAADDR() lets you wrap a property around a dma_addr_t
member without assuming anything about dma_addr_t.

If we use its (trivial) expansion instead, we assume dma_addr_t is
uint64_t.

Whether that's worth avoiding I can't say.  Depends on how much the
abstraction leaks in other ways.  Thoughts?

