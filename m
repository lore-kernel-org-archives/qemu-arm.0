Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp233373lfk;
        Mon, 8 Nov 2021 04:30:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMYJXFn4C2R23iGMeTQDI49iefwNGc5biHXkGJQD6XB8iaO2lJ697pO0H0ZlCrPotOGhhy
X-Received: by 2002:a05:6102:41a5:: with SMTP id cd37mr104271406vsb.28.1636374641302;
        Mon, 08 Nov 2021 04:30:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636374641; cv=none;
        d=google.com; s=arc-20160816;
        b=W/+BXpFOdIzlWr3msjSpoDnf4tcrFvIcMTtVq1bkQ3GQHQ7XepDJpfYLtV7YZssUKt
         aOgnaDxnqgQfy67QgbL0xkaFAsJnWQJFWj2gZm169mcpZ/HndReNazUNUz1abiBhqEcq
         nWXGMDkHz5iGRvlAvCAJKJFFaYPnJBKzFdlUymDH0Kq2mmqqauqlCV6O30pGXcO8Ngyk
         gl8TNTRh4YN5knd5z1DLlmYIEcDQNetoAtrDt6mMee1cdE8O4J1Sy0hffAuvc8iZfes7
         F4EmbQHyvCA8mLfwx6K/j4ZXcqpwfRcBhm5N6o/vfMDCc4CGD5q0qI2HOYqJSNMALBC9
         4l2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9LqyPLtrLefgHSoFxwcNBbwmeZfd3Qeu3k/Nt9hn8ko=;
        b=XkuZDu0c8z1K6utHipbdLZobahq/BhlhBYHYDd5qv0hzdES0c5nEduLia979zSPCSh
         DvT8rnUm9wAmL/1pvzBzjlp9spevi09oK38u3e+ahKoyTRLuxp4/25FJ2mewm5/iRHPS
         l2O5R4VuIVDqG+W5UEX5N/DE9kbv2RAft3js0YQ6MAO+J1uLHUnZ+ZF4uA0Nkccxg9j9
         6casEeMiB//yS658lMtdnT3zLidhJjVibSbmaBaSBpp+qzXTXCslf3zOvl+3a33Rx2JM
         6/M4R+sImpQ6/wDouXETnbUFQhwzhGQ45GS0mD5nbEk6qE/+PfwpLVcXrLOBSkxruU8r
         OLkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dgI7CeFf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b19si25439120uaw.199.2021.11.08.04.30.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Nov 2021 04:30:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dgI7CeFf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mk3nM-0001d0-N7
	for alex.bennee@linaro.org; Mon, 08 Nov 2021 07:30:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mk3nD-0001c1-7E
 for qemu-arm@nongnu.org; Mon, 08 Nov 2021 07:30:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mk3nA-00021X-4j
 for qemu-arm@nongnu.org; Mon, 08 Nov 2021 07:30:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636374627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9LqyPLtrLefgHSoFxwcNBbwmeZfd3Qeu3k/Nt9hn8ko=;
 b=dgI7CeFfivBaTKVpsx4FPNWi8+fZ+TqHFyzZAe2vfyLIxHqACZhmKk0Mv/FsgKE3jCa6KQ
 gOjZytT3k8NER9Ss9uxVhQwWWWD7NOH6d90KcPJbZ9f7ySXi4Jz0zVwQJg0metSTM1XLmt
 m7Se4e38c5WopwgOVjFblkXlQ8hW2zA=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-ZrCqWeppNXuLJLJ5GxZknA-1; Mon, 08 Nov 2021 07:30:26 -0500
X-MC-Unique: ZrCqWeppNXuLJLJ5GxZknA-1
Received: by mail-pj1-f69.google.com with SMTP id
 bf17-20020a17090b0b1100b001a634dbd737so7236890pjb.9
 for <qemu-arm@nongnu.org>; Mon, 08 Nov 2021 04:30:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9LqyPLtrLefgHSoFxwcNBbwmeZfd3Qeu3k/Nt9hn8ko=;
 b=4QBIYgMWLu2V+s+YDXc0J/BZCBsnkN0OHch38AORlruBvQaHBOhHA/z2MZI9vYGLj6
 A2AvJf/kbS5nvg3c3nrSrb0ePIRAXYqRp7gA9EQ/rF/YW8kg0a3IXUGKydqZbyeSxSv1
 ooBoqmiPP0DeL0NEXDk7EyYfudDOC1qTll7zbO0T2o+ZB37HpGSKCE0YN6NOAjDF1YzS
 mqxJhIO9xNrDmi3nDwV79ubtU4bEnMbtUVyi0RtMX0eF7XHVnSVlKyOFSsgjA+DAp6N/
 JS+IXliv4R4TsfUexY02kQ6XI/4bIev1RNGEFD9YZxbV8uwdFu8UDlP62lFBGl88FmOi
 8wOA==
X-Gm-Message-State: AOAM532OA0vs4w0/PZ/kjkD09DpqtQp4QaWYPW4X8L8m/ZBGJsRgVlei
 8uiKKjeqWRWK20vk8V+4UILDXStLy6I5QIeNkxdERGaTAqrC758E+NA3cKE4eJSVpYvruUFYfVk
 tzTLD+no5/Qtf5N+nTnhbitBl8gUH
X-Received: by 2002:aa7:81c2:0:b0:47c:1d4:67f5 with SMTP id
 c2-20020aa781c2000000b0047c01d467f5mr81984039pfn.38.1636374625123; 
 Mon, 08 Nov 2021 04:30:25 -0800 (PST)
X-Received: by 2002:aa7:81c2:0:b0:47c:1d4:67f5 with SMTP id
 c2-20020aa781c2000000b0047c01d467f5mr81983999pfn.38.1636374624812; Mon, 08
 Nov 2021 04:30:24 -0800 (PST)
MIME-Version: 1.0
References: <20211106091059.465109-1-philmd@redhat.com>
In-Reply-To: <20211106091059.465109-1-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 8 Nov 2021 09:29:58 -0300
Message-ID: <CAKJDGDZJC_pqigs8GHFT_uw6rOBT917zeTNdSYga1LCi2-xDFQ@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: Remove p7zip binary availability check
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v7XYSMBxXEE3

On Sat, Nov 6, 2021 at 3:14 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> The single use of the 7z binary has been removed in commit a30e114f3
> ("tests/acceptance: remove Armbian 19.11.3 test for orangepi-pc"),
> we don't need to check for this binary availability anymore.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Based-on: <20211105155354.154864-1-willianr@redhat.com>
> ---
>  tests/avocado/boot_linux_console.py | 7 -------
>  1 file changed, 7 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

