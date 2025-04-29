Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp550271njm;
        Tue, 29 Apr 2025 14:26:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLujs9qAbz8d+6HPXwHCQRJsCaw2KPgj0Yr5KUx/pBfXDJzHXlM15Ik89b/2pbxocdfIZh
X-Received: by 2002:a05:6a00:986:b0:736:43d6:f008 with SMTP id d2e1a72fcca58-740389c84b8mr1039136b3a.12.1745962003101;
        Tue, 29 Apr 2025 14:26:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1745962003; cv=pass;
        d=google.com; s=arc-20240605;
        b=Q5BwQZKJyy+dx4Pz2gK5AAwk+8RAET2FP4cXnckTyObwRPA963MXx4aSITKG8q0eg2
         I9MLzwxdtSktDGNDgNVotEqDtgtB+vcZYp9oaJba0foPBFRxPFpUZ+MuWqhY/iNgfO/+
         9bMvUMBGVfY544N7pb0XMExNhUJLItdyBU+TL7EKzy0PV5CPGP+lrcWOlCUCWsPjT8Yo
         +VKK0YElMIICbw9OMacZ4uCKj7QyLwtRkXWfPFyiYjl1ZufEz1Qc3inZn6yJorm/WSLv
         5nVIPXfcCtBKjUTQg4ZZJFRgPssL1uhgCTVZ5IdUJhZSMgjaxaa2yiImsjUWKXWtadeN
         I/TQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=n5glU0FlvTlvVa30Iq18L5A5JJTQ2PT2eof4gDYLDqU=;
        fh=47m133iozJJR9xJVPFXzH38DrozukQ8R2ZquLybNDT8=;
        b=LXcT3mlrkZONdH8dsBfRUToihVFbW37EDkYXG2clJY2Y5U/v/5WQdb5JcnmysU4u9n
         QsYqWacmoUHiJCyKftND+7F6PpjkpJYK6k3jCP9SO75u7XALmCVvltnWttJiw+bjRagP
         fOM2qaqdCkabBCgPWrgm/F4w8y1/EZM/+tYLy45ftlnueOgjihyY4GGSh3saS/qaTZ5S
         8Aq8Y6aw7Fz0NXjn4gXZleeAND9DiNPDRJ8GPHNVtnYec/Xxm8l0A2bWnazFY2g0xHzn
         vS9bwyoorLOyY5J+0HsHOe0dO+p5ofV8H+Jlm3G8IWqtMlYD1lK/wGrKCAootmrIKYxA
         4Qnw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@collabora.com header.s=zohomail header.b=dv5MyZhE;
       arc=pass (i=1 spf=pass spfdomain=collabora.com dkim=pass dkdomain=collabora.com dmarc=pass fromdomain=collabora.com>);
       spf=pass (google.com: domain of dmitry.osipenko@collabora.com designates 136.143.188.112 as permitted sender) smtp.mailfrom=dmitry.osipenko@collabora.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=collabora.com
Return-Path: <dmitry.osipenko@collabora.com>
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com. [136.143.188.112])
        by mx.google.com with ESMTPS id d2e1a72fcca58-74039af41fasi319821b3a.342.2025.04.29.14.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 14:26:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of dmitry.osipenko@collabora.com designates 136.143.188.112 as permitted sender) client-ip=136.143.188.112;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@collabora.com header.s=zohomail header.b=dv5MyZhE;
       arc=pass (i=1 spf=pass spfdomain=collabora.com dkim=pass dkdomain=collabora.com dmarc=pass fromdomain=collabora.com>);
       spf=pass (google.com: domain of dmitry.osipenko@collabora.com designates 136.143.188.112 as permitted sender) smtp.mailfrom=dmitry.osipenko@collabora.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1745961996; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eB4VYw7y972t0cvMk/NfEmef4dGf7lGFGv1dFwfR0goulyQFgC9TzhFXvzXS/4WIDVR2MXvGFdjy4j3Dupkxu/gcJEYTTeNkngusoDB9Lii+86VVIkpYX9L3i5Bse4NoAp9N3WBK3D2vuV6BepDdhBhwM93pKMQDZh/m6okHRs8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745961996; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=n5glU0FlvTlvVa30Iq18L5A5JJTQ2PT2eof4gDYLDqU=; 
	b=AqZn+px0cWs/6H0aH6bHnVyr4xzqWfibHVYKsiWO4A9ZfKbCQ7XW8fxraJ5KQSQWIvrqkP3hUp9zy3PqDL+U+Zi5rHyz+BIMrsTG+lxJB0kx+bP7toOa3FsAJ4TulyCKzr/kdz45d9ap9clE/hF3uyFjyN2quSRskS/WTZyWVFA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745961996;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=n5glU0FlvTlvVa30Iq18L5A5JJTQ2PT2eof4gDYLDqU=;
	b=dv5MyZhEbExyxpNjqCIvy0Q1WUDoleraMk99RcWtNBSWTI6bJGkJJiyTCpcb1+Q2
	ost9kdmFhk58cw1tmBXm4X5J6DfBCZ73tbJIp2HnkSKdbf+hmJ/AAngwpwo4V5RmxPU
	GyAD8ZFzyWBKGjXoWF4GHuNFmvkb/0QOKjqcO2uE=
Received: by mx.zohomail.com with SMTPS id 1745961995758660.1143623261877;
	Tue, 29 Apr 2025 14:26:35 -0700 (PDT)
Message-ID: <33ae8cd5-cc5c-4bfd-9c0b-dd71b80dfc0b@collabora.com>
Date: Wed, 30 Apr 2025 00:26:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] virtio-gpu: fix hang under TCG when unmapping blob
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Thomas Huth <thuth@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-stable@nongnu.org
References: <20250428125918.449346-1-alex.bennee@linaro.org>
 <20250428125918.449346-9-alex.bennee@linaro.org>
 <8b123991-21f2-47b5-851d-6b53fbfaa691@collabora.com>
 <87o6we3bto.fsf@draig.linaro.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <87o6we3bto.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-TUID: rFjBLofOr/54

On 4/30/25 00:19, Alex Bennée wrote:
>> This change makes QEMU to crash.
> What is your command line to cause the crash?

I applied this patch on top of native context v11, ran AMD nctx and got a crash on SDDM startup.

(gdb) bt
#0  0x00007ffff5411b54 in __pthread_kill_implementation () at /lib64/libc.so.6
#1  0x00007ffff53b8f9e in raise () at /lib64/libc.so.6
#2  0x00007ffff53a0942 in abort () at /lib64/libc.so.6
#3  0x00007ffff6cbf18c in g_assertion_message[cold] () at /lib64/libglib-2.0.so.0
#4  0x00007ffff6d2ea07 in g_assertion_message_expr () at /lib64/libglib-2.0.so.0
#5  0x0000555555a42820 in object_finalize (data=0x555557c9d290) at ../qom/object.c:732
#6  object_unref (objptr=0x555557c9d290) at ../qom/object.c:1231
#7  0x00005555559f3df3 in memory_region_unref (mr=<optimized out>) at ../system/memory.c:1854
#8  0x0000555555a003a7 in phys_section_destroy (mr=0x555559ef5b60) at ../system/physmem.c:1035
#9  phys_sections_free (map=0x555559c2dd80) at ../system/physmem.c:1048
#10 address_space_dispatch_free (d=0x555559c2dd70) at ../system/physmem.c:2692
#11 0x00005555559f1d33 in flatview_destroy (view=0x55555a54a720) at ../system/memory.c:295
#12 0x0000555555c278cf in call_rcu_thread (opaque=opaque@entry=0x0) at ../util/rcu.c:301
#13 0x0000555555c1cc68 in qemu_thread_start (args=0x555557993d30) at ../util/qemu-thread-posix.c:541
#14 0x00007ffff540fba8 in start_thread () at /lib64/libc.so.6
#15 0x00007ffff5493b8c in __clone3 () at /lib64/libc.so.6

-- 
Best regards,
Dmitry
