Received: by 10.25.0.6 with SMTP id 6csp766173lfa;
        Sat, 27 May 2017 09:19:03 -0700 (PDT)
X-Received: by 10.157.35.125 with SMTP id k58mr3434598otd.214.1495901943760;
        Sat, 27 May 2017 09:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495901943; cv=none;
        d=google.com; s=arc-20160816;
        b=ClSer0cKv2gbGPvQ7t0rbSuK8R0Skizt+WfvlpaNufnfNZm54iYcl58l2x5Ywz6L07
         kPzLbIMcRBrKs6QBbOieOzTsZOW5P/Esv7tLeNBgAchHzFUUeQHq77l9ZUpVhZzl1ZUv
         ngqxezcfkPvHF1Fzh5vfDxrncjsXdNfMFaKJxllz4q7jE5cSIwiwlWP2enOtCBEzmZxS
         318uC3HqUwIs44zmIPtJNz9xso0PaMEj78p5AN+BmWfhpnyBeKIIDyc5mQ8lNiHPSPL1
         zFLutKmq/9oZlUFzcCLZrdAkeskou7pUX24EYJoEU2+yoReLRMIjwJe0KGlKehHVXTGR
         MDzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :arc-authentication-results;
        bh=87atvG3AV6unUT90kiFvXQK+VSsTwf++HlAEYy1L0WA=;
        b=zO0UqhHSbdASyUZDWkOlATVOtlwF9QWJrcCimUTjomYqG1mqtOU5+Vvj5tNJzY8sQE
         3Gm+TBHfNaORlJp321tw/t1Jp5EnTGi0SBPjtfhFeR2AuflJ/inQ6+yF/6v2Hyc0JdmK
         wIg8/W9SEpzFVdK2xBYpfoP5A31rxoog/IB21I9Y/0HJPeOcEep0I17IF2+2vsfMH86K
         Ci1XnEhIZVOeSzMGF31zV8TDPJPC5DlBVAlfhj4tj2f/m3IZkX7tYplviFOYSNk1V2fB
         2hPXVYH7uLNrTnQk87gjePFJ6hnRtfeHUPDLx4TgQ9vTTuQtvj/DSK1PidGgn09dEUNG
         UUww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::243 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com. [2607:f8b0:4003:c06::243])
        by mx.google.com with ESMTPS id o101si1705839ota.19.2017.05.27.09.19.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 May 2017 09:19:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::243 as permitted sender) client-ip=2607:f8b0:4003:c06::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::243 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-oi0-x243.google.com with SMTP id w138so6020941oiw.3;
        Sat, 27 May 2017 09:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=87atvG3AV6unUT90kiFvXQK+VSsTwf++HlAEYy1L0WA=;
        b=imBa+rVEATROqWFSAnkDlxxC/61kEkTI7spbWSf4J8v5FD+Ye9b55SpA50csB5RY5p
         k7IHkUkzKGv/TssDHTamAX0ix0K+bOQpabinWqtqpiV46aC2rsNvxPe9f5fjnFkFHX1N
         xXjz1aTduiuPmurB6L6W8AxoWMRZH8G7HlwyC4GtyTI4IV+5cxnh6dp+doeODuLfc06A
         MgJ7MOi7RxrEW2s8iMDtaJpekSg7wYPEr19XdgMdmotSndmYUFy1v3vSm+LFZJ1WPMpT
         kHkr3W1TQSip2ZCI1MHS1RuDDzGAR5HVHdM/22uxbqyPA9SxHYnqmO6HJhUiagrRtfIz
         hqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=87atvG3AV6unUT90kiFvXQK+VSsTwf++HlAEYy1L0WA=;
        b=B92cV/oLAYATU5c1epYnKB2lyUhX2lkul/hnvgGtI6JHW+2XleF7eloKh7Y8tO5hUi
         PqLyqhale62Xtx75HY63IL1sTLZXM75eMPSsvAqz4PcmIt4FTfW0LNMl/kieIat/X1B/
         94gXgFmS/BGI1XtTbrw51RFupushxOlHVAeqFDaeYr12lVpmSgsAmn9eBkuOnrxHknWv
         ThNtMTukWItHTXOYcw4Uo1oaw39R3canXWdTBT2eGfz0cGKGV4Rb43Ok9JBbrMwNFg0u
         FbNL5ohIf1b0Ou2BWyC5OBMLOMh+LRehA2WzYelFCoKzH1MCEhyU+7d8x+E6in0Yv7Mk
         2NMw==
X-Gm-Message-State: AODbwcDb7kJPTLD+trWsf2TGd65g7x5pbyT9trJIzih8LwNZUnzkYEWV
	/2xcITm9c1unqY/hYbo=
X-Received: by 10.202.230.8 with SMTP id d8mr3516242oih.206.1495901943413;
        Sat, 27 May 2017 09:19:03 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from yoga.attlocal.net (162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
        by smtp.gmail.com with ESMTPSA id i32sm1953113otd.43.2017.05.27.09.19.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 May 2017 09:19:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 20/24] shippable: add armeb-linux-user target
Date: Sat, 27 May 2017 13:17:51 -0300
Message-Id: <20170527161755.7761-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170527161755.7761-1-f4bug@amsat.org>
References: <20170527161755.7761-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: s7kUNP/lN1CJ

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 .shippable.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.shippable.yml b/.shippable.yml
index fe360f85cb..2070c4d827 100644
--- a/.shippable.yml
+++ b/.shippable.yml
@@ -6,7 +6,7 @@ env:
     - LC_ALL=C
   matrix:
     - IMAGE=debian-armhf-cross
-      TARGET_LIST=arm-softmmu,arm-linux-user
+      TARGET_LIST=arm-softmmu,arm-linux-user,armeb-linux-user
     - IMAGE=debian-arm64-cross
       TARGET_LIST=aarch64-softmmu,aarch64-linux-user
     - IMAGE=debian-s390x-cross
-- 
2.11.0
