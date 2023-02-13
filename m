Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp245569ejb;
        Mon, 13 Feb 2023 06:24:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+vN8lDFoz8VnaKnBXIdXX4T3qCCie44uu6iS/AcD3HAsduokSEv4A9+UZX5xrGBhDv0wPb
X-Received: by 2002:a05:6214:27cb:b0:56e:a84c:ceb7 with SMTP id ge11-20020a05621427cb00b0056ea84cceb7mr9793388qvb.17.1676298280690;
        Mon, 13 Feb 2023 06:24:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676298280; cv=none;
        d=google.com; s=arc-20160816;
        b=Usu5HQSvTveIMsxtxobFqUlLdjnhULlU1twMYY3XPVfW5vNQXw8kfqTRy9As6sbIcn
         zG7vRTdWdZj6l3tvtAblIpdLrdDJdauowgmOWrwsh/KYT81EeXnqbk9fdsgZYapZb20Z
         H7zduUf1nwOyKvQ18el/jJ6hFwlkfzpOHSLuPxHv9Z0qLKF1YZJrFWs2qUFV8PfoX92L
         lq/awE+GuVjMwJmSmtpC6gya9MWHeo6XH+xeCreebWuIQlrqeR61zx8xpn/2K+QefIAd
         Ho9HJA6rO+hRYKPxjtvG/oy/P3jHr5w2EJbFmjNWev8wUkxiZp6eI4k2Tsl5rYA69OoU
         CklA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QSXH+UT/ENijXW1AQ5vXTQqj3NZWL0J+vOdgeUpC0yo=;
        b=Ls3AT4JsYcshvR3TBeWc/xrCQDP8Z4kuxsMOol4/ODe8PwB+MFJfF+C5Mn5v4LtEML
         ciDAol04HeoseR9ZbKz4v0U+MNFQhHrvP/n3jeXmQIGASn42WqOxeSjkd+7m5Xfg1WK+
         UlibSkjTPLze/pHgk19MCLseEmbkQaSmHw4POwOMIXhWeVXydShU7W8UzETRFBSZ5KyD
         iITnEzOpdn2Xcg35UPoqExwkuYrXzvaTpvTOoXTAww1sacWVQg7WT0wKzeyrCTAWx5mh
         +PMlG6p8m9JLCrN8cbkB5xo1MHfCUX7a+LpFcyWA04ka+iXpCij8vfjIfGcuxjll1YdX
         KMpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DTxU3CFt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17-20020a0cf511000000b0056ea7eafc0asi3568924qvm.487.2023.02.13.06.24.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Feb 2023 06:24:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DTxU3CFt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZko-0005Jc-QH; Mon, 13 Feb 2023 09:24:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRZkm-0005Dq-ED
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:24:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRZkj-0001ws-W7
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:24:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676298258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QSXH+UT/ENijXW1AQ5vXTQqj3NZWL0J+vOdgeUpC0yo=;
 b=DTxU3CFtj03ZFZzDFrbFDTEv2TcxKrAVmplxS8H8DU6JhzUR8U/EKgNE/ufJHC8d1GgVZl
 EFQcaIwmmSWnI9LOfz0tjMrevqFsF1G3yY2dtKMc75k5hS/D0WPHgbs00j70UmQW9n+l70
 qpwot4EibJmMcJwGEMkACwb3VIX32bY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-62-Ou0vKvfRMSST0-ZY0u4c3Q-1; Mon, 13 Feb 2023 09:24:15 -0500
X-MC-Unique: Ou0vKvfRMSST0-ZY0u4c3Q-1
Received: by mail-qk1-f200.google.com with SMTP id
 j29-20020a05620a001d00b00724fd33cb3eso7583496qki.14
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 06:24:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QSXH+UT/ENijXW1AQ5vXTQqj3NZWL0J+vOdgeUpC0yo=;
 b=5ymdapDXaW64TUD+KaHetY11v1wfsqRXYrbDD2RR+qX1ofVThAk6lcowAE4C2Qdz/v
 jECQBOc5UVnnu2axG/Ix6JPUWGY4jYSrNgMrjWkhRlZ0hPGtuceF9yIYimCByRUMNXr7
 YZsgOXjpvaYHV0Sp2beYNrNNj9FcWhX5Xb/j4DAXrrxE/VD8MD9DFpofL+kfzOhTDWOB
 pkcfZ2sEJp5IBE47gpJLHmYX+A2XfZnpk6PUrTm64FDlj7SHmgg5qx3ihp0vccV6iGS2
 0FZ3pJecM4uXUXiRd1h3+HQgrmEE5WbDqjEOO31ElOFmbxOPLUqFJWfe1Jmz9RkkjbXC
 jGSg==
X-Gm-Message-State: AO0yUKV7oHY7yik/ekBE9759MULBYrdN7dKw4Nd0IE2eoa32hd3cM7Wk
 Jm6amYTYNuXFUmtXKSP+PlPkMCa53+pSPXBjLYdbWWRzXckzlRyPWZzBrsoAgn6gBruDUkS0FCa
 W5Mm23QqRYnSNyus=
X-Received: by 2002:ac8:5850:0:b0:3b6:3494:174 with SMTP id
 h16-20020ac85850000000b003b634940174mr46356537qth.52.1676298255001; 
 Mon, 13 Feb 2023 06:24:15 -0800 (PST)
X-Received: by 2002:ac8:5850:0:b0:3b6:3494:174 with SMTP id
 h16-20020ac85850000000b003b634940174mr46356511qth.52.1676298254773; 
 Mon, 13 Feb 2023 06:24:14 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-185.web.vodafone.de.
 [109.43.177.185]) by smtp.gmail.com with ESMTPSA id
 r6-20020ae9dd06000000b0071d7ade87afsm9680329qkf.67.2023.02.13.06.24.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 06:24:13 -0800 (PST)
Message-ID: <383a2e03-7ee9-cc93-72d5-7f039314f932@redhat.com>
Date: Mon, 13 Feb 2023 15:24:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH] Do not include "qemu/error-report.h" in headers that
 do not need it
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230210111931.1115489-1-thuth@redhat.com>
 <87zg9lpre8.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87zg9lpre8.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.345, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rtjwXiJbB4ah

On 10/02/2023 14.43, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> Include it in the .c files instead that use the error reporting
>> functions.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   RFC since it's more lines of code - but I think it's still cleaner
>>   this way.
> 
> Yes, please!
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

FWIW, I just noticed (thanks to the gitlab CI) that I was missing two more 
hunks:

diff --git a/ui/dbus-console.c b/ui/dbus-console.c
--- a/ui/dbus-console.c
+++ b/ui/dbus-console.c
@@ -22,6 +22,7 @@
   * THE SOFTWARE.
   */
  #include "qemu/osdep.h"
+#include "qemu/error-report.h"
  #include "qapi/error.h"
  #include "ui/input.h"
  #include "ui/kbd-state.h"
diff --git a/ui/gtk.c b/ui/gtk.c
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -36,6 +36,7 @@
  #include "qapi/qapi-commands-machine.h"
  #include "qapi/qapi-commands-misc.h"
  #include "qemu/cutils.h"
+#include "qemu/error-report.h"
  #include "qemu/main-loop.h"

  #include "ui/console.h"

  Thomas

