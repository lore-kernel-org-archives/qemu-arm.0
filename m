Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2006055njc;
        Mon, 22 Jul 2024 09:07:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVKVq5VfwIGQffG2SShNCtu9tSYpDF0Gwxdfg7JUy8IEiqvd2dI8D60tizuh7TybqJ144uRpgcD6Wq8ttvla6JzheBqRLKG
X-Received: by 2002:a05:6000:c4e:b0:368:4226:4085 with SMTP id ffacd0b85a97d-369debfe527mr243128f8f.8.1721664474836;
        Mon, 22 Jul 2024 09:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721664474; cv=none;
        d=google.com; s=arc-20160816;
        b=sISJCsJeRW/fKVYCKh9Jgw4jrXbu9MlGgCgcsMOw4qPVy02DJy4d7ofKkWiECxOBSc
         7K9IPL4gifSafYTN962VYq0ZYfluCSAzH3k1dcbgeJPXbmTNnSN9izuY/VIXCFWmBkjV
         Jgbt32922h1wHqk1LmYI2M5jzbj+GenjlNIPo2EKERcWGpW1kQaFCrfvYPUeC+dFxm2P
         bd1T4j8p7e1tDFVuOEjRuMqotO4xcZ3xXM4wjiBRh+oxuCezCG4ubVP1EXHLhZ2YE01X
         oSJepk3oONKSUXXxxDJ3mGz8xm89rT2iglmYu4ZWlDlM0+KZRFA5gk3qlhF1BBu3masm
         rIuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Qcm1dWrebznI1t8ebTrFn2d5NidY82tKkmYUS0FD2gQ=;
        fh=Na4rGXc4xBr7FysRzE/aBiObkGSlyHc3IWyIMTEveE8=;
        b=RjKroezOlCxUNaNX5OLjs0XHgpODATPW2l9ZBnwaMrULz0131w1LXDEvwmkG5yGE2L
         j4SFxxkz5MuBKR3t6XHFrt0Vb4mtavdxXPx/hP1VG++jis+tXiuIr3kD38NckAfjwiyV
         c3lb4+jOgid8LTpPCLY/9PByHCo57E+NNCoQ3HK+G7WWjnkjWNpv4upU3DB5VjvD+wUc
         ItVcetfnXjCuEB32cqfza8S9BJQfBzJhda/ZWP21cLoaVeTqByc5Y4vJbWoMgbTiE/ZU
         SUSlZl74vpB5w1X68y50jq8SEa1wo/4jLlYcvKsDBxGudJBM1W0xADALVoOnIGIlEhj0
         Xh5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XlkLwF1d;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3687860e413sor2125227f8f.0.2024.07.22.09.07.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jul 2024 09:07:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XlkLwF1d;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721664474; x=1722269274; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qcm1dWrebznI1t8ebTrFn2d5NidY82tKkmYUS0FD2gQ=;
        b=XlkLwF1dpD8HZt5IXV6gBUy9fQcD/+uR5YB/MHikP+ikhJE9Nqt+eWoxWUUHEqugYx
         lM1GvH3tZcrtieS1J1CWrc+H3hLc1F75q0ypacJ7+//5ihZaiPDsS+/U8LT0sNklwMTH
         H3l9dngQj6mCf1IevOu9UJUqjAD01EskYZM/SJp5/IP3fMc7UWIY4hsAkloy3/uPyP0O
         95X4b5ejRcxk6OW3Fl3dOGDsyAa1t0XitV5jB9OvxAIb/pFLkIaPKXH7HjFepRimf/eX
         /xz78c6ZoipxQJj7jASFjCEsQ+kv5lhCekwTSMvZNNeXlBiR+xIj/6WNUFW0nWjDz3QT
         dqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721664474; x=1722269274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qcm1dWrebznI1t8ebTrFn2d5NidY82tKkmYUS0FD2gQ=;
        b=UPQv4imR6wBHSdaip5RF2UkpZ7oXMfMqc0vLZklXWjxFpBhGKNW8FVpAmh+PfI5ZEP
         JvJXLr3TvUR8SgKFlnCkkaE50hJ9lJOngWmspWw2OOcUtXUCJLHWgZtcarwP4sWha//Z
         G+OAcS2m7zhWY+D4pe0o2G/VZ5k70usKFeIhONFWtGmmshWKh6+GYfTsDKbI82LqgIgb
         3hySH/pkuJ/9xPtv2E9qTMYpa1fG6KIJwFPYGX/ca7ur0kevY2B+3NokCkgYKpf9iNaS
         ntai4GaSKYpDk/UeznXlY9RsYDlGxIviR8hU4+H2ZtwpBVryjPFLwYmfDGqUOvI8r5Dc
         5sRA==
X-Forwarded-Encrypted: i=1; AJvYcCXoGqXbwcZmxTPCbeVuKgpwFTpVPiYNVKDmibJrxlt00IbG+JC7LV29K9flVLx0kjOuBio1tOy2YzqI4+DJdlm54g8DsO7Y
X-Gm-Message-State: AOJu0YzFHIM79Xs7VvwBKsqnNXb/39rINUjg2gptaIW1NZr/CaowY13W
	A1f3jXOfm3I8A70m3J/4xcpLWCMzWXsTFhPdSagC3gSBkWUMJymLukiSwswOAQQ99A==
X-Google-Smtp-Source: AGHT+IHUiOdd5zhKEM8wd0wDnkyHCYq8h5McOhCLMzlh0XaA3hJKKozIc1odihHXY0dc7Ih77ZpZEQ==
X-Received: by 2002:a5d:6b02:0:b0:368:420e:b790 with SMTP id ffacd0b85a97d-369debf8ba2mr218506f8f.14.1721664474403;
        Mon, 22 Jul 2024 09:07:54 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (gen92-h02-176-184-20-254.dsl.sta.abo.bbox.fr. [176.184.20.254])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368787cec6bsm8920870f8f.71.2024.07.22.09.07.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jul 2024 09:07:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/7] chardev/char-fe: Document returned value on error
Date: Mon, 22 Jul 2024 18:07:39 +0200
Message-ID: <20240722160745.67904-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240722160745.67904-1-philmd@linaro.org>
References: <20240722160745.67904-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QcM4yQz2x38R

qemu_chr_fe_add_watch() and qemu_chr_fe_write[_all]()
return -1 on error. Mention it in the documentation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 include/chardev/char-fe.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h
index ecef182835..3310449eaf 100644
--- a/include/chardev/char-fe.h
+++ b/include/chardev/char-fe.h
@@ -228,6 +228,7 @@ guint qemu_chr_fe_add_watch(CharBackend *be, GIOCondition cond,
  * is thread-safe.
  *
  * Returns: the number of bytes consumed (0 if no associated Chardev)
+ *          or -1 on error.
  */
 int qemu_chr_fe_write(CharBackend *be, const uint8_t *buf, int len);
 
@@ -242,6 +243,7 @@ int qemu_chr_fe_write(CharBackend *be, const uint8_t *buf, int len);
  * attempted to be written.  This function is thread-safe.
  *
  * Returns: the number of bytes consumed (0 if no associated Chardev)
+ *          or -1 on error.
  */
 int qemu_chr_fe_write_all(CharBackend *be, const uint8_t *buf, int len);
 
@@ -253,6 +255,7 @@ int qemu_chr_fe_write_all(CharBackend *be, const uint8_t *buf, int len);
  * Read data to a buffer from the back end.
  *
  * Returns: the number of bytes read (0 if no associated Chardev)
+ *          or -1 on error.
  */
 int qemu_chr_fe_read_all(CharBackend *be, uint8_t *buf, int len);
 
-- 
2.41.0
