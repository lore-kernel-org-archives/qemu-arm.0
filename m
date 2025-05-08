Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp619953njb;
        Thu, 8 May 2025 11:26:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXA0Gv1kgBUUYM5hTobBjX4elbEmt9uAH54mFHyFG/uCs29eOp0qQRG+wz50f8kM2XCGv1861+TcDZBOQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE66UeWW9wna5TMbOv0X9UQMe4A6ERAc0aF4avtspnrz3DZScqxEP4rBZYWoqKH3pSdox4c
X-Received: by 2002:a05:622a:53c7:b0:48c:51f9:5dff with SMTP id d75a77b69052e-4945270d508mr6982801cf.4.1746728783679;
        Thu, 08 May 2025 11:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746728783; cv=none;
        d=google.com; s=arc-20240605;
        b=En8jMcTuL8O3dpytb26YnuzKAPVU0/0q6RjnQcsPUiLSySxJmjkb2BhIKJ22dBLz+M
         fk8a/9PC3YD3gV4ZzwGQLR/PR0m00GZC6vMESy8yfkFqqIAqsHExV5G228bYPgewtjxM
         M1BNtztEHXNoP6UR5yCKOPYIuHG7H4c8OzZQ2VyfZS8Q1UppgYONG3oWoB+dWaf8wuYg
         8dEdBketCLjiEDGKiMDPJKjAxa10KGBOP2WueNDTh4Fric033IMVr4M6YcpbVQ7AIMGB
         vul5und/ApeA0gLEfwawE+4oxQCPv3OmCK9wxu3B35c0jNTqjkjnL781TeOVRpCBr8BN
         hmnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=X9vnhctJ2F9wAOEBjlbdbEG+CIBdatb8uGg0+uwNypI=;
        fh=ajQYQfqozG9mYw4+PIUYX2P67hNVS+kIpTtOmtNvuWw=;
        b=gNJObgQoQDcJyqO7OT0hGNpXOLJ3vRKEcqViHJddchz3/RJIzDpT/+PU09Vt2D9OkA
         2LfrpZxYs8UrSPvOFCBD1AwYk9dwGdpfQ5NDxwDDbYo2z6MchJMYOPR9azsPtDLJ4vQ/
         YXgvRAyfB6isDPO9jlPZ46tjs5/0ozU3j9aQVzS54tH7VywWQUUSjiCN6ulOoTSnE6NG
         m8xZGrw1eEiwFa37Dr9sFVbz3HkJFJM2LYrCxA8OyAI6BurpxT5SVzNIdyaFKxjohCt5
         gLo48aY5q4Fl7R2DEzA8X8kREIBG/P7nk3/pErB3oxPkOgT/nnlvSqEwNrPFR4i9yNr1
         Rc9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BsZyS4OO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452458ccfsi2730671cf.29.2025.05.08.11.26.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 11:26:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BsZyS4OO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD5wW-0007Je-9X; Thu, 08 May 2025 14:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1uD5wL-0007Bh-Me
 for qemu-arm@nongnu.org; Thu, 08 May 2025 14:25:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1uD5wJ-0006fw-0e
 for qemu-arm@nongnu.org; Thu, 08 May 2025 14:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746728745;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X9vnhctJ2F9wAOEBjlbdbEG+CIBdatb8uGg0+uwNypI=;
 b=BsZyS4OONNw7vqoHgs+QIfFtcw1v9u+91ag0WPzmdN+q9qOu53+5hVpGQlSxOuzxZf8vRm
 j93M85wF73JoHKWLyBwgUT6YEDy5li8N5laXb6pX9tADI6/zgjHeKvBE7ClY7lwHTkOJJD
 7aQxyvS9S0TteDTXYOC9/rlblnyIfgM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-651-sQaUcRa8N52UJ10Hf1Na5Q-1; Thu,
 08 May 2025 14:25:42 -0400
X-MC-Unique: sQaUcRa8N52UJ10Hf1Na5Q-1
X-Mimecast-MFC-AGG-ID: sQaUcRa8N52UJ10Hf1Na5Q_1746728740
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C625D1955BF8; Thu,  8 May 2025 18:25:40 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.138])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2345430001AA; Thu,  8 May 2025 18:25:36 +0000 (UTC)
Date: Thu, 8 May 2025 19:25:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 4/5] tests/vm: Update OpenBSD to 7.7
Message-ID: <aBz3HIZ2Ql3WVd6c@redhat.com>
References: <20250508144120.163009-1-thuth@redhat.com>
 <20250508144120.163009-5-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508144120.163009-5-thuth@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.416,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OwzNqNX7yqD7

On Thu, May 08, 2025 at 04:41:19PM +0200, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> OpenBSD 7.7 has been released at the end of April 2025, so let's
> update to that version.
> 
> Reported-by: Brad Smith <brad@comstyle.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/vm/openbsd | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

