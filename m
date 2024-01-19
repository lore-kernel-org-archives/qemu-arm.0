Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp868762ejg;
        Fri, 19 Jan 2024 03:14:27 -0800 (PST)
X-Received: by 2002:a17:906:1b47:b0:a2c:7df9:b8b0 with SMTP id p7-20020a1709061b4700b00a2c7df9b8b0mr652847ejg.219.1705662867783;
        Fri, 19 Jan 2024 03:14:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705662867; cv=none;
        d=google.com; s=arc-20160816;
        b=jmQU7ViB1+m/YWyz2tDeXX8u/SjWJ8hE5sEtV1Sr71pbF5GCVlCQBC7htB3FAZL0vx
         rAe7e8Ze2dV2NAp13eOcUhoJMPbYFg+8Fi+3k9s1caNoSOgGMIxUFqBu8K32i46fcfTR
         AnYFyiEDgLtx/dPpyhhyhXiWDdn3cszzAI1iOv0t+Mw2n+DAB4sUmXdE+dzhGbFYjAx/
         sjOdb/LMo8c13c7v3BPW8m15WL+AeRPWkV8pU6RtFk9QcXz3KQsnq1PPrnCr2iv1oS+y
         i2R7boiltQYXCXVvyY/kbPUTS05z2AZVJyFD30xnGaqg1gtJPMpF/eJo9/SLWXEDilcl
         bpXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=E+lMoeMoENzkmlbQHjTZz2Re+qm7+NP5TWh7XqMJhP4=;
        fh=2YMDnQ3SxoZ0TW62CmU2DrPnMMetFtoAQMKRN2o0WyY=;
        b=zAy8QxbbWyC7PZBBueYloTEjCkmedttGWx0B6zvyTTTAZ6umkhPKqzJfPJ8/Bl+U8b
         oCPYbNp+XmvSw12QJnIQPkfQFXN8MUBrOUklkFUm+05f3Xm4mAWLT5jTUWXfMqILGhAB
         Zyfp4Egsy/1+QQ3LpVEvrOJtoc6v4svaxNDiuXq+NlmPFbz3Uv5PWpSxZC0yLw53GwX6
         7TppxbFi1J44IaKDTRL3stFpEhZAN4EyK4lOxzsRVCQxCIOuWq849cZHcf/PhPP/MnBA
         cpyrTo7J9wQ4CVdehhERshi4NIPgfCGSTrdETv7s4tKybERHYATlhL04QeTpcP3mnFF/
         RFYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s7PG+4Xo;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m10-20020a17090679ca00b00a2de39ac21dsor2666261ejo.18.2024.01.19.03.14.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jan 2024 03:14:27 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s7PG+4Xo;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705662867; x=1706267667; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E+lMoeMoENzkmlbQHjTZz2Re+qm7+NP5TWh7XqMJhP4=;
        b=s7PG+4Xo9AknXuJZImLsmEPoogFTD5AHhHnW899ZBHWUy9JEbOz7vVnJxx7r6alOWI
         6W4eQ7Cqn8KYVfgyF+AjOuDUamKi2FJQqW50ef5hlopuK+ITFHUuY8iGLRQZWDwVobhE
         Hx43RHJeNXByCw7rTkLZWDCRnJVTTAqeGnVIYGv3YMRnM7uIkE5vx6Ua4ii2saDbDzXS
         cnSb3LpW19Hh+9Zk/OZnDDxOlgr9qOeLoks6QLOAo9XTFU4ik350NrWy2YrVImqlmmDt
         dr1vsv3NQQze6OAuHmu60/QtOmJ/SmZnUvaT1IvGsDIPK2S3cQsU4ftahdSbqWutL6tc
         dgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705662867; x=1706267667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+lMoeMoENzkmlbQHjTZz2Re+qm7+NP5TWh7XqMJhP4=;
        b=hN4tGurhJfNYdzNAlGAiKoIPgsH/J/ySUsujfSMWh8ML30ciOCwsB4OFnGtoYEuPfN
         86e8sbyfrrsXpcY1PZZkVJX7BlI7JXAnTQnclbh98Cdrj0aSx5vO4XdkJqippz5teABb
         EGy/87ebdpBjcahpyHQBA0RIoUskfVwOaFPDhsZaQqRcpAWsVXCTzaXGAnKhZl82X77S
         7a+JXwTLTwPH+oijZpQ27CviKT6wcSzf158zv+NdULqVoU1btuscpO+uuTTI8+jDtThw
         F38wEuidPlR2uNlJWdwPPlA1kSVN9ktvvxQwv7vXF/jJ438Rc5i+DsWgow1NAPTP9t2H
         lKJQ==
X-Gm-Message-State: AOJu0Yyx74Q+Rr+sfA0ZRc06f5h5PUx+U4lcVvvsy5OZE9S858h44TUa
	OFwi4u1iaXrnkcuFkOe2LYRFI7IfSA0Mq75FZHqi8gFoC9RkLqp8mUzeNdgWm4mlPA==
X-Google-Smtp-Source: AGHT+IG40CgX3vOLQiJgJm70QwwjNvZv0B3z0ek20UxsECgAhubD+AJ+rw987qMVtTfGtNiOpQHV7A==
X-Received: by 2002:a17:906:b809:b0:a28:d68e:4372 with SMTP id dv9-20020a170906b80900b00a28d68e4372mr558547ejb.74.1705662867371;
        Fri, 19 Jan 2024 03:14:27 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-114.109.242.227.tellas.gr. [109.242.227.114])
        by smtp.gmail.com with ESMTPSA id vq9-20020a170907a4c900b00a2ca97242d5sm9283321ejc.120.2024.01.19.03.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:14:27 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/6] hw/{arm,xen} convert printfs to trace/reports
Date: Fri, 19 Jan 2024 13:14:18 +0200
Message-Id: <cover.1705662313.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: 7tPVbbkPdcW4

This series changes some printfs to use the trace event framework. 
Additionally, it converts some error/warning reporting fprintfs to 
error_report/warn_report.

Manos Pitsidianakis (6):
  hw/arm/z2: convert DPRINTF to tracepoints
  hw/arm/strongarm.c: convert DPRINTF to tracepoints
  hw/arm/xen_arm.c: replace DPRINTF with traces
  hw/xen/xen-mapcache.c: convert DPRINTF to tracepoints
  hw/xen/xen-hvm-common.c: convert DPRINTF to tracepoints
  hw/xen: convert stderr prints to error/warn reports

 hw/arm/strongarm.c      | 49 +++++++++++++++-------------------
 hw/arm/trace-events     | 33 +++++++++++++++++++++++
 hw/arm/xen_arm.c        | 26 ++++++++++--------
 hw/arm/z2.c             | 26 +++++++-----------
 hw/xen/trace-events     | 21 ++++++++++++++-
 hw/xen/xen-hvm-common.c | 47 ++++++++++++++++----------------
 hw/xen/xen-mapcache.c   | 59 ++++++++++++++++++-----------------------
 7 files changed, 148 insertions(+), 113 deletions(-)


base-commit: d0f4aa7d50d485b1fb5ec8ab6f934e5df852ab07
-- 
γαῖα πυρί μιχθήτω
