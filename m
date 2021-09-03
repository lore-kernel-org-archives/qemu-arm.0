Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1175740lfb;
        Fri, 3 Sep 2021 04:09:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzuKydizO2r61JDa0/sB9tRIZfKQsHX+5xmHQqg5cyQUncKxAZztdxhrTfbmjZ5c6fyeqV
X-Received: by 2002:a17:906:4452:: with SMTP id i18mr3580384ejp.374.1630667387796;
        Fri, 03 Sep 2021 04:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667387; cv=none;
        d=google.com; s=arc-20160816;
        b=Wu1+JN+we0KS5pxkXJMup9njyGFauTUxlvFgkCcxkD0amc/RkhE31pmTCIzoY/72r3
         TFG/CoqM0gPtcWCtFlNKnx7sj/7Vc8IyOy+UgnA2HH3jderQF7cKU5K3EFAGnaIPmahP
         66ZhZsl/btLQdhGMeKiEGGUHYUABJEXbi9gv9FOaCakBiHvQ04G3/eIzvlRQjXQHcIoW
         jKcyBlA55JpjZZ2+LJLZWGhIUDzcfVvc1lEFYkPqJYx4anfoc8wquFPPetazRnFUFgqj
         busvlhAC/Pg81QxxUojx/nqhC9z9v6OrNDqjFnTYlWIk2VVy3Rt8OhA588DjYpSWtmt0
         iBTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=i6HJ8MqhTy0s+GzLLhKT2UPzz5+277m7r3JgXnumMB8=;
        b=dO7ue0MeRikGvYDGokrnrgbGMnQzz3fCAZGHHqaHmOg5/u/VVi5BHcZv/Hjcvprq/6
         EQ5Yhr/866FCaed5VDHL3v9wFptjtSLoTTVUIn1vitjCUbrKSxLoNv+Zwrng80yKHi4t
         DA0RU/k1xJtsLjW8Bu3cCmwC67Gme81jAy9bpS8DhO24VlK2nqe+PvwOEZDnObkjpF5K
         8vMvwklp+ooBNOoXliiTWgWaHIDFcp5uEAo14Xz6yzbPWg4y8NSo3mbX882M0XQ/TUH0
         v0aKljYoo82raakVwYoxUwilABiFovF/vYjb6lnkcBQD9Whm6f2KmMQrj8+kvqP68tly
         TB0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dj1cw4F4;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id h22si5102967edt.53.2021.09.03.04.09.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:09:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dj1cw4F4;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i6HJ8MqhTy0s+GzLLhKT2UPzz5+277m7r3JgXnumMB8=;
	b=dj1cw4F4RIxxspQuGotaecoHDO+GCg1YjTub3Qnt2FkapFfXup0YFoKKMTquM00A5D1PFs
	D8WZYASnx3ZJCiZgBx8U57RPQj6zO+iUlUCuxuzTOKqsmLGDhbIzdg8HWOmpl7uITVP0Dj
	+yUX+ItTlgoBCaQFlFMRXPcGvm74Wkw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-oMCx6TCdPkyJWRNSbsoXpg-1; Fri, 03 Sep 2021 07:09:45 -0400
X-MC-Unique: oMCx6TCdPkyJWRNSbsoXpg-1
Received: by mail-wr1-f69.google.com with SMTP id m16-20020a056000181000b0015964e4ae48so419046wrh.14
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i6HJ8MqhTy0s+GzLLhKT2UPzz5+277m7r3JgXnumMB8=;
        b=Oo4mWd5UBeBoPUV/ExISZOxwI9f24y83LsZ8qYnau9NnGqPzMyju/kVntAmn7PQVPv
         eZNbGRf2utXHjwzhb3eZ/Go1niTJZAilGBeIKdT/td0d+Z3FPhT6ogAnmYYOP6swYOo/
         Fd2hnTWTzFrGTBXnVpv+WersthOvZZPeQ0WEUR0K06+XQ0isbN805ugEgTKJQVHu4boS
         8CeUVknSqBaUG3oAhoolVDiEK84qnYUdU8UldQTYQbbH/H/TAob4MxXG33ja+ijr2+xw
         e/UqqlyVdyZVaxFpmQWLdZjMPgtz+ifTkyODpL5ZZVGHGFZ4PDj1AeDfLxJqB6/kgsAP
         FZ3A==
X-Gm-Message-State: AOAM531oKD4+TNAFUAKYnVGqFOMcmdcVlQuIEHHPLdZ9fKTUJwCZhLyM
	3chUA2p4mECotpA7OhJjPYr0kPmBXb/rqWUF+yLzIKOZINNzakrnNlq+K7L/qcsS0ei83xt4aSg
	H+7swR+nbUa3mqqI1
X-Received: by 2002:adf:d1a8:: with SMTP id w8mr3454890wrc.306.1630667384526;
        Fri, 03 Sep 2021 04:09:44 -0700 (PDT)
X-Received: by 2002:adf:d1a8:: with SMTP id w8mr3454844wrc.306.1630667384303;
        Fri, 03 Sep 2021 04:09:44 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id t14sm3887073wmi.12.2021.09.03.04.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:09:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	Zhang Chen <chen.zhang@intel.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	John Snow <jsnow@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	Helge Deller <deller@gmx.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Xu <peterx@redhat.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Jason Wang <jasowang@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Yuval Shaia <yuval.shaia.ml@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH 28/28] checkpatch: Do not allow deprecated g_memdup()
Date: Fri,  3 Sep 2021 13:07:02 +0200
Message-Id: <20210903110702.588291-29-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oRKbeleyyv+o

g_memdup() is insecure and as been deprecated in GLib 2.68.
QEMU provides the safely equivalent g_memdup2_qemu() wrapper.

Do not allow more g_memdup() calls in the repository, provide
a hint to use g_memdup2_qemu().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 scripts/checkpatch.pl | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index cb8eff233e0..4ce9d753492 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2850,6 +2850,11 @@ sub process {
 			WARN("consider using g_path_get_$1() in preference to g_strdup($1())\n" . $herecurr);
 		}
 
+# enforce g_memdup2_qemu() over g_memdup()
+		if ($line =~ /\bg_memdup\s*\(/) {
+			ERROR("use g_memdup2_qemu() instead of unsafe g_memdup()\n" . $herecurr);
+		}
+
 # recommend qemu_strto* over strto* for numeric conversions
 		if ($line =~ /\b(strto[^kd].*?)\s*\(/) {
 			ERROR("consider using qemu_$1 in preference to $1\n" . $herecurr);
-- 
2.31.1
