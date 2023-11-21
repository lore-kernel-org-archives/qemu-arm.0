Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp537753ejy;
        Tue, 21 Nov 2023 07:08:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDU24FZ6d5/BMbUN0QN0X661B/uEYO/ybNBHNXiHEhGBIfCEk0orqD+BN5IQhvUv5LSaBj
X-Received: by 2002:a05:622a:2ca:b0:419:7623:ef6c with SMTP id a10-20020a05622a02ca00b004197623ef6cmr12885912qtx.60.1700579294781;
        Tue, 21 Nov 2023 07:08:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700579294; cv=none;
        d=google.com; s=arc-20160816;
        b=Lsx+0lD5uQTRgJYQmc2kJzqoGSKY/GXdlU/iB30AqZH4OwCGTCZsf8RNGylFOEX28u
         c72SxyzxIlt4KymPM+l4yAKRLT5tz4CO6FtQUzHKxXMuTAQqeeVxEHseHh2cfYvad2iz
         SuYSevtJBh7QwcBavKk4luV4LP8Pffov6qA/236w17vPvacdKfvPMKK8pjcnkGQi3OVn
         cee0R8MlW8b72O3GGMLKLMCfedf8u1Uo+SCZtRQt5XJbwiq2/biE5y0UV9YYrC6fRTzw
         HQ/WxgaOMVVHVfHV9aLyEus7qs9rUNIxxEh7TOzzzH8OyxjUu4APr6NK7sir/jHPNYA8
         f8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=1GSjdejaIkSnIT4cCLg/NjGrQGmQeD/4fkrAtjM02OY=;
        fh=c6ULJfaQNRUNEdxrbW210G9JWo+FNw09S3FkAb7ND0w=;
        b=zU65RD+/DKg0pNwlS8UZpXXepk3DueWxic33bgFsc0ezLInG0D4gMF3FkaFKoIw5Ay
         8ZlEDD9lzAZ6AiOe1s3WrcLkhDkkSoCQwpp9Rw+v4MBv+s1afTMwT8paCiVzWPSiH/O/
         UhmDl3XiISkf3Gckpzyd7iVSOj3u85BeCdtAGUabRowrNpJTQXrSrjPUsa7jQORMhJGy
         6znveoaMRuaqEmf551MpgHW7Qj9JyImaIBjCintszBPeZnQNVjC1CSHGEbzUrL5astRe
         5Jj7aSKNn4upizh+rtXYnU4518H2i9Fv8wldjt/vq85ZSCQsU7q0CPqRtSTR5ayzxowg
         bJqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HGDLnX4q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv11-20020a05622a4a0b00b004236e6460f0si1809571qtb.50.2023.11.21.07.08.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 07:08:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HGDLnX4q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5SLs-0004e0-9Z; Tue, 21 Nov 2023 10:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1r5SLr-0004dc-CM
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 10:07:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1r5SLp-0006Wg-0P
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 10:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700579264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1GSjdejaIkSnIT4cCLg/NjGrQGmQeD/4fkrAtjM02OY=;
 b=HGDLnX4qkcMdP5LJ+Ad56A2I7T2oAvx3Nz419QWs7mFs3kHb+r1/IQvlRjA4hIc1F62Lzx
 BFN0Z2qPRWoot/TgQXe3ROTRvVB/hEZZSXDNZdKIKXHSJBbubqrfIKh7NpEirjvFpljRNm
 GcBBfT/c8Bow68rjuk3XfeC3GeZFYz0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-8mzXV5VfN8ybRdNqloz9OQ-1; Tue, 21 Nov 2023 10:07:41 -0500
X-MC-Unique: 8mzXV5VfN8ybRdNqloz9OQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-778a3e0b755so107761785a.1
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 07:07:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700579260; x=1701184060;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1GSjdejaIkSnIT4cCLg/NjGrQGmQeD/4fkrAtjM02OY=;
 b=AkZf39/5Zjbsc7zd2UHs5FiUDYt1Em2GkyUnAMgeZMN/ev3CZPhAxGP71G4uPKYAS+
 kEYVkrNLDiS3SU3uYkN9J8zeuU9SaxzTvNYcOXWYN6QLovkLYVUIbJte7+MUXjxM6a0x
 84cimH6ZyTSrq2lC7MmGXjadTVKyZm+c1b64Gv6uOcr8aFsgZ+SPnSM1MJchkXl9UC0h
 YBwK58wSiHZFECrZx8leMgEwyW+iWqqO2jxXYTAeta6hoy1BJS6x8p3uXWrA2pgrb8nt
 NxJI6VURBTyRMdAjHOZenFV2lIyRj+MRGgVzaL6nbt8cwPa3DB5Lm2zwZ2h6MstXgu0D
 jzTA==
X-Gm-Message-State: AOJu0YyYbGaPrJ8bs7SVC2vLY5Z2X+9aixcKmlS+yhMob3HImliCTBwa
 IJi0B2Ab9N1dLnUYEAjINpqLwtvMFyEGFaSEn/7jOrwJSHnkM0SUzKlgqSNJMc7gjsnkGvyre1p
 IXvKQoDFw6nUW
X-Received: by 2002:a05:620a:4542:b0:76f:167a:cc4d with SMTP id
 u2-20020a05620a454200b0076f167acc4dmr12735172qkp.2.1700579260582; 
 Tue, 21 Nov 2023 07:07:40 -0800 (PST)
X-Received: by 2002:a05:620a:4542:b0:76f:167a:cc4d with SMTP id
 u2-20020a05620a454200b0076f167acc4dmr12735141qkp.2.1700579260250; 
 Tue, 21 Nov 2023 07:07:40 -0800 (PST)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 qf9-20020a05620a660900b007676f3859fasm3696730qkn.30.2023.11.21.07.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 07:07:32 -0800 (PST)
Date: Tue, 21 Nov 2023 10:07:28 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH-for-9.0 18/25] util/oslib: Have qemu_prealloc_mem()
 handler return a boolean
Message-ID: <ZVzHsJFXaolo5_b0@x1n>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-19-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20231120213301.24349-19-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2N2K2GSdCg6W

On Mon, Nov 20, 2023 at 10:32:52PM +0100, Philippe Mathieu-Daudé wrote:
> Following the example documented since commit e3fe3988d7 ("error:
> Document Error API usage rules"), have cpu_exec_realizefn()
> return a boolean indicating whether an error is set or not.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

