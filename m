Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp1178804njh;
        Fri, 30 May 2025 07:24:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzdRxF0TD9Bs33PzVGXzHeFNu7hKNpyfzT9n8qRNJVn7eIqJ1KOPnqcu04FpEffnIirlvE+5v6OMY2Lw==@linaro.org
X-Google-Smtp-Source: AGHT+IGEaPBRK+fck919v3TwLRdiCrTQVxElrDPgk1n8EmhPZEo+7Bv0aldyuGy2kcjWvRyibShM
X-Received: by 2002:a05:620a:190c:b0:7d0:9da7:6941 with SMTP id af79cd13be357-7d0a201df56mr566175085a.37.1748615053030;
        Fri, 30 May 2025 07:24:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748615053; cv=none;
        d=google.com; s=arc-20240605;
        b=fMQ6tIEApToaHHWOhLAn1Bp6EIR465qZgbHzZsXB361qj+NaqFhWJxwcwXv3z1Gv8R
         KFT1wiFrstwBu5aA6UoKnFGKBurI9gILseWrvcqKJyZ/QtHPsYTF+RTIv3+A7pfHMiaB
         qzhv2rCGaWOxA2UOYVIEzRtA5J70K7E2jaKTjBa4Jyx5WjZVYbt9UQHqzhVP+RZ894tE
         HiFCEzx1eC3uWvSy8lGOGGF+s6Wl4Ha17La2jWTDDpN2q8YqdGfgpYmv/r+GBbufZuiQ
         rW5ZruwSejCiH+zfY4gnH9ro47oUArzuOiuoi3Eobyq/rl9FFPv/8nUjhLxfliugOZwN
         NL4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:autocrypt:subject:cc:to:from:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Fa/E/pz8FKK/+GUwHeYAbpPT7qBTqflw2mrY6516cxc=;
        fh=nB9fZQ5cJRfOSOOowxgQm4Qu8VbRRdmRLvZcRADuEqU=;
        b=Ep1EYwC/V2jdAmIscD/KgopHEe1rR+Mk0k4qicDzUIU6/3TtHk9ruxA0JBcm0l4tNq
         5nU+HEsRelRezvOsk5rcZYTcgG2nJPFg7q9a6V00kVY+Ofor3Pwbp2AahoPjjFA/61GU
         CivrFVF+K9fDd140Z1UDdstGvwcERg5JRacTNwxLikfEVgAVJbKdqVspWuLBJckCsC/M
         xMjyZrKUTEY4gajA+LzcI6kSCxO5hDHhPl5LFxOQE5q3pVrKb/kBjvMcTJ6VieP10PFf
         Dww6JhUU0YNkFF85k6Lr5QCq/TtXwvtYVjier8XiIrfsmp3fCoU/hng977EOuUc4+wnj
         yUew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MtND2TNb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-87e2a3a1695si1143797241.73.2025.05.30.07.24.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 May 2025 07:24:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MtND2TNb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uL0e8-0007rL-Ub; Fri, 30 May 2025 10:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uL0e7-0007qz-KT
 for qemu-arm@nongnu.org; Fri, 30 May 2025 10:23:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uL0e5-0005DK-Oi
 for qemu-arm@nongnu.org; Fri, 30 May 2025 10:23:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748615020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
 bh=Fa/E/pz8FKK/+GUwHeYAbpPT7qBTqflw2mrY6516cxc=;
 b=MtND2TNbZx8JVl5IStggOUout/sEQ83KR6y+5ElMNQXhUlY/jwB4kkviVlTDA2WbOMSdad
 orzEagPkQAxTYA0DkgjbvYd6oac3/GwaDmxgBsClgDX8RxBa3dsGXZQhaG6FC93vxtVPs/
 UAaVjzBPzZWfqGkk3IemYRwLQvt6bI8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-PZq50uwrM6qg-K_GG8p8hQ-1; Fri, 30 May 2025 10:23:37 -0400
X-MC-Unique: PZq50uwrM6qg-K_GG8p8hQ-1
X-Mimecast-MFC-AGG-ID: PZq50uwrM6qg-K_GG8p8hQ_1748615016
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a3683aa00eso1029847f8f.1
 for <qemu-arm@nongnu.org>; Fri, 30 May 2025 07:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748615016; x=1749219816;
 h=content-transfer-encoding:autocrypt:subject:cc:to:content-language
 :from:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fa/E/pz8FKK/+GUwHeYAbpPT7qBTqflw2mrY6516cxc=;
 b=VrmGfoyRDlaHH8LBPwr8Qzb0sWsCvndGrq7xCnmVWHipw+mCD31Xae1OcZL7bbw1t7
 gO160lziyMDstAzi4HGm9FSkFAjQEEnZ6fG/dsjBh8lLembjCpOv1xZZksr7jbl5rF4l
 VEbHdXsFzstMXM3LSNByzwznK5nmT2ypx4yKgaKVWpKIGaTyB+4FlRGQM8TkjeOXG17e
 KqH/cxqGTdCHkhWjxUHg/q8yrZrhHtnUAMXDq/xFeDIphsq4UTXqrEuAx8N2DzNNRT9z
 fEN1Sn6uP1d1ed04ZEtqeG6nrtTSdo5g7F2aeipWiCShkB23HPsmAfaHt7vb+TxfQlYN
 0kow==
X-Gm-Message-State: AOJu0YzoI5B2aWNH3PJZ8cbMEkkXax6WC80f82dnOvC5CrZNSpYh3TDd
 gNmSBQ6U3YDnNf4c4j11eM3mQUcaMdlG5uO4XkPP7+qYjm+p0Eb+weybUhK4tvAnV43vj96d04Z
 8/GftUwn9VlLaXMZxv/Z+f750UZiqi0R260GIEze2cyzb8OHZZpGIRg==
X-Gm-Gg: ASbGncvYno3xLVKTtwfOSwNk48zFpWTxzZbBqjvJGxtpqyX6uPl59RDONqtCIozElDj
 I1ZBGD7kI4Umz6GMPy0AIuQ6S2viZT1PtpBSkc782r2p/BnvSrb8Elfd1YE5J0b9HKWjVz/afj7
 +UW2SFEZxlBWlMPKXpNzASFkwZwofhJD8Yl7+mXXFXWn11gdEwXiz+uRUpVS4OOE1M5iZJ7KiIs
 uHljrtqN/1HRQFqT5TTeB76cmM7jZFY8NqfU0A9JsZY30l5x1BbMCq5qXxSJEhv7iBeN1s/aLX6
 qXdygqGczb4KVRJsYXYDhkBEULZBYqg5mtkmyDmQSFxEP5/K6QhhPZaYTMq30dI=
X-Received: by 2002:adf:e745:0:b0:3a4:da0e:5170 with SMTP id
 ffacd0b85a97d-3a4eedcd099mr5409336f8f.27.1748615015840; 
 Fri, 30 May 2025 07:23:35 -0700 (PDT)
X-Received: by 2002:adf:e745:0:b0:3a4:da0e:5170 with SMTP id
 ffacd0b85a97d-3a4eedcd099mr5409320f8f.27.1748615015446; 
 Fri, 30 May 2025 07:23:35 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-112-237.pools.arcor-ip.net.
 [47.64.112.237]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7fa21e4sm19716805e9.11.2025.05.30.07.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 May 2025 07:23:35 -0700 (PDT)
Message-ID: <7aae8238-f7f4-4f3a-9a7e-e9afc99d1d0c@redhat.com>
Date: Fri, 30 May 2025 16:23:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thomas Huth <thuth@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>, QEMU Developers <qemu-devel@nongnu.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Is anybody still using the "highbank" or "midway" QEMU machines?
Autocrypt: addr=thuth@redhat.com; keydata=
 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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SkzKs0D7TvDH97_YDggIKqMdNU6X92ez_M_ZxgNHfws_1748615016
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.907,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: LGM27NtBKn+P


  Hi Guenter et al.,

I was trying to create a functional test for the "highbank" and "midway" arm 
machines of QEMU, and only succeeded after lots of trial and error to boot 
something on the "highbank" machine. Peter mentioned on IRC that he also 
does not test these machines by default, so we started wondering whether 
anybody is still using these machines? If not, we should maybe start the 
deprecation process for those instead?

  Thomas

