Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5071847ejc;
        Thu, 31 Aug 2023 05:59:09 -0700 (PDT)
X-Received: by 2002:a81:92ca:0:b0:56d:4d1e:74ab with SMTP id j193-20020a8192ca000000b0056d4d1e74abmr2757744ywg.23.1693486749409;
        Thu, 31 Aug 2023 05:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693486749; cv=none;
        d=google.com; s=arc-20160816;
        b=DD1dAtOXz2/jhH0HC1W5H/7ApdKKEvLohOGDAaQUoY9etNUtT6etr6Az0+dDT7hseT
         LLqC8ZfS8b6rQf5Kw1a6yl8k5cb2O5WD5rjXvxG2E7yapEYgCHUiQbTTE2MmMsjrEayr
         n+s3MVi09B4w2x0lSTaOcAZUARBFko1UsUXZRIfu35wqjpC057osWPwfGCfvk4LZ6ZJ5
         q/AbYqh784KCIb9X3kTEoGnRh0sLovC6Df1oOzQcIU50cBCrGzOTOQ5KYJUSVL9sAcnW
         kaVu2JVI4NsykNSKSHcwCDUOhilBRgnxI7RvpNqzTGNn8DoTJh8qQQyRhIHN5mak/QfI
         zv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GxA/5EXb2SmpDTy3rgcCO3KdbceHG3sLJR7WKjQ1/Y8=;
        fh=C1g9WbLYbqb5ZMWGblSPCb82pDI9M8ifDDaJhEe0Xjk=;
        b=ygGUGouxRPlGjP2MMEF3kYRAcDxA8aJmGR22pLuDOImJDCGLdL14U17WGcN3ke3KsZ
         TLqtUbsjJ9uDs5/cMAvSaO3HYkrpfLsxSqfnv06i92DVXaCLB6ANQdn4hpoqhrbvmKvR
         PEXyZCaRsZKIdWhqV58wN/u56grcqNr9ayXx4659+PcrSZRk97PqubBhb8UswYhbb2Fa
         2Wtb8r6LPo1gLfpFQNS/wo5GrgtJC4Z47cy8shb920hi64L/sijAS28D5H2P8hQwLikh
         vbB7+lrhBR6I2AowCdoYS1Niwy7xftxigfj2aegYzTihV1zD+/iuVrnEeRrLEKWKOISn
         X3Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mH+XvquF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n17-20020a0dcb11000000b0058615cca848sor853231ywd.9.2023.08.31.05.59.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 31 Aug 2023 05:59:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mH+XvquF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693486749; x=1694091549; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxA/5EXb2SmpDTy3rgcCO3KdbceHG3sLJR7WKjQ1/Y8=;
        b=mH+XvquFuJT00Jrlf7cIJdNCa106vCz8DLsZZxN+gL1OsW8PZucjDaakFAG6zsOT1d
         xgm0eCmWOLdVQthbv/AuykzEuzA51wE64RdPU8gWlnG2JGULL8Lg26PSzjvL2MXdr8K2
         E4RyQRV+cpo4tU7lz4c/uUwfos45Tqk8Vj5LPFdWlQ1MG7LjIYWqn49BoKx+g8Qg8kk3
         3tgupT3Q9O/JMbpRxA4H71aQrAn6/mygoCcEz3QTn5kPC3y7cQgAJTp3SFTUAb3NJAqG
         dbOYq6Y1G4LhSwDo3S2e5eMssuna41fkx/wiBme3id7/7yxy/narLEVcZ5/tZBoB/QaE
         bvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693486749; x=1694091549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxA/5EXb2SmpDTy3rgcCO3KdbceHG3sLJR7WKjQ1/Y8=;
        b=mAyLkw1DCTG2msMi+4ps6dpNoBLFPZfbjbQ16IXm7YU4CTnY7+td0eZn8eIM5knUX/
         h/r3zMHzbIyovIdXTbOveH0BWDvP0M1td1KhtX2+5GWjBKRNIhiKMzTPM7gUtu4vGIa3
         kLXKQvXGt9Fx0bkZu2rppkWtOftmtkWU+R50xA5kFOWqS3E0+LekQnzlrwbLLnWWRKsC
         eSF6yknvabNXj64KWvY58Op/elAuQgdKX1TUhWw3te6EFH+gAo0SHfA1ESwqkIVp9Rn2
         ebgd59AFiQQIqvAMBhgNsKpEtk2VYwaGdL06BQ7FqJXtKcxa5MSKIWrm2yyB96gZXOOu
         zQOg==
X-Gm-Message-State: AOJu0Yy8lx6yBceqRBY8JRt2/O5Rj6CBYRfYQFz/wgxnXLn2EavFqqJq
	izKtPbsoocQgOzxmVu1VlcH/hZ/z
X-Google-Smtp-Source: AGHT+IGZURAw3hFpSJjNx80pusv4a+zH+7FD/wa1hmsdENsbIvNg1i+IISlDxc3wVmlX5600ur2vOA==
X-Received: by 2002:a0d:d6cb:0:b0:58f:bda3:7d9 with SMTP id y194-20020a0dd6cb000000b0058fbda307d9mr2154104ywd.26.1693486748816;
        Thu, 31 Aug 2023 05:59:08 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.199.245])
        by smtp.gmail.com with ESMTPSA id b131-20020a0dd989000000b005772abf6234sm391546ywe.11.2023.08.31.05.59.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 31 Aug 2023 05:59:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 23/41] hw/char/pl011: Remove duplicated PL011_INT_[RT]X definitions
Date: Thu, 31 Aug 2023 14:56:25 +0200
Message-ID: <20230831125646.67855-24-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8lOl7DL7k/0d

PL011_INT_TX duplicates INT_TX, and PL011_INT_RX INT_RX.
Follow other register fields definitions from this file,
keep the shorter form.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230522153144.30610-6-philmd@linaro.org>
---
 hw/char/pl011.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c3203e5b41..96675f52cc 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -48,9 +48,6 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
     return dev;
 }
 
-#define PL011_INT_TX 0x20
-#define PL011_INT_RX 0x10
-
 /* Flag Register, UARTFR */
 #define PL011_FLAG_TXFE 0x80
 #define PL011_FLAG_RXFF 0x40
@@ -157,7 +154,7 @@ static uint64_t pl011_read(void *opaque, hwaddr offset,
             s->flags |= PL011_FLAG_RXFE;
         }
         if (s->read_count == s->read_trigger - 1)
-            s->int_level &= ~ PL011_INT_RX;
+            s->int_level &= ~ INT_RX;
         trace_pl011_read_fifo(s->read_count);
         s->rsr = c >> 8;
         pl011_update(s);
@@ -262,7 +259,7 @@ static void pl011_write(void *opaque, hwaddr offset,
         /* XXX this blocks entire thread. Rewrite to use
          * qemu_chr_fe_write and background I/O callbacks */
         qemu_chr_fe_write_all(&s->chr, &ch, 1);
-        s->int_level |= PL011_INT_TX;
+        s->int_level |= INT_TX;
         pl011_update(s);
         break;
     case 1: /* UARTRSR/UARTECR */
@@ -350,7 +347,7 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
         s->flags |= PL011_FLAG_RXFF;
     }
     if (s->read_count == s->read_trigger) {
-        s->int_level |= PL011_INT_RX;
+        s->int_level |= INT_RX;
         pl011_update(s);
     }
 }
-- 
2.41.0
