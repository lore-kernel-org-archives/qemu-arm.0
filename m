Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1059958lfq;
        Thu, 10 Sep 2020 00:01:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9RqI+3h8vl8AGk1P81zNKYksi1ebXmxUYK/mmnQL2CLPHAaw2bavJpPANUBNbPnNpoR3M
X-Received: by 2002:a50:d942:: with SMTP id u2mr8093896edj.0.1599721298040;
        Thu, 10 Sep 2020 00:01:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599721298; cv=none;
        d=google.com; s=arc-20160816;
        b=GDRRrLOA1W/MfegzM0U9/WKvnVUI6y7YMJwZQoyMtUCIlzxiP7lZ4SWLoi7DE/Oejn
         801f/9lUO4/S7DVBt+HruhdrxGDIU67uuXvmYE0N3uF8hvvFLZ6IDb3zcleeskd22owp
         1tPOpMuEepRuHyV1fevrQrKmTV/Gcrp1hjDEVa+g2ctbQxXXwFS75qBgnVYkP4K8QlTo
         PrUEEMLCKr7kMVWvHjfdJSO8dGuRwE8F2iLrm3Ht03hfFTDPu0hGvIpZuLHINhS/9Nf5
         akvef2ho1NK4xEJnmT410m1SqVyWfHMroIB5ALCMsPV8DTvgvCK5mCUg2npOOh9SyC74
         9DEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Y1vGmD/fvsXEOWa6wkRKs3aLydzIceOGg7Tbh5f+UXQ=;
        b=xRXdR+7yvyHES9e09MZOmYcSIufTMzTiujfRxU7CZZMPMCZiIFSZF0v6p54ip4vq69
         2CmlIYdfT5EKK/2th0sCoyx9WNgMX6r0dhvt0TrRlP0UyURvnsZ41x7ttqmmDUV0rCE1
         CEyPSuwQWDAKQBBEXw9P2N0X+dU2xgWokO9oVrgW6Uivbw5mLhHgFQEDmJ5o3yUp60Uh
         uaApg1/q0P+VcgVkU7BIMHp6882LZgn9eXaTMF+9hQK47jRmnVWjANM4q16AYbEcRO6Q
         EKUxqHYTX+9HMoehzq0D8Eq/neJDg+fcv95jYuraxtVPnpHjMkgMG1mDOBkN0i67tmVd
         bOnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GWjYsRTr;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id yh22si3520093ejb.421.2020.09.10.00.01.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2020 00:01:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GWjYsRTr;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599721297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y1vGmD/fvsXEOWa6wkRKs3aLydzIceOGg7Tbh5f+UXQ=;
	b=GWjYsRTrA+NnxLIECRMVdbYv0rX9n/OjSIMEmuL36MAooVd+C2d5d/Mmtc20YCUQh2dHe7
	uznluxpwZIPTOi4BwtjK7RhVkJ3zwmoGwPkbZO7xGDBqfqJ0ZTZzX53Q4BH1W0hQ2kH9Uy
	//26XvyVJxHD7EUN7bpJLF09yCgSWwo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-movMP8SCPoa_Me3TflqCYg-1; Thu, 10 Sep 2020 03:01:35 -0400
X-MC-Unique: movMP8SCPoa_Me3TflqCYg-1
Received: by mail-wr1-f71.google.com with SMTP id v12so1888550wrm.9
        for <alex.bennee@linaro.org>; Thu, 10 Sep 2020 00:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y1vGmD/fvsXEOWa6wkRKs3aLydzIceOGg7Tbh5f+UXQ=;
        b=a6JRksHwu+c8UrbEPvW/lyLmUD8Fi4BxQk/wUt4ZOrQ/4E7JSp7eruZELFO9swbUwE
         Vy+dI7Pl6Obhw3RfkaO1uJLGIVJP8q2+1W10mbMFQT/epvS5MJm2eeV0EkApr3wbqCa2
         /R9aIHLpoQ+dz7LYADb9//EDJBKUaXtEgSne1OKgdJfYwir3PLdwrGaInhoz0Ibarmbf
         VulGdAHFb1UHoV28IccZI1wsDVtvMdi9cXPNTxOgQFzw9EWMNJajPAnyzZFH6w3traBw
         6wEsELjSgQKPMlWqhX8GsjOlVu+NVRHSU8IDqxrYgJs9HHWG6jT1p79M8HujHf+NimXm
         G7Wg==
X-Gm-Message-State: AOAM533I9go3dJzOEyoHQ2C0JkE0N37nIZoffaMnIhDJ+OpYZLMdBRsy
	IJuI5AsDf6gxIDqA1pqE2JemqNPL3any5ld+fqWKrxv/bCIebXz0qbWhXg92jtx6d6C9zCf9W5d
	36do3uVv9VynShu7y
X-Received: by 2002:adf:f2d0:: with SMTP id d16mr7037148wrp.332.1599721294399;
        Thu, 10 Sep 2020 00:01:34 -0700 (PDT)
X-Received: by 2002:adf:f2d0:: with SMTP id d16mr7037127wrp.332.1599721294215;
        Thu, 10 Sep 2020 00:01:34 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.65])
        by smtp.gmail.com with ESMTPSA id c14sm7314726wrv.12.2020.09.10.00.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 00:01:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Jason Wang <jasowang@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	qemu-trivial@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 0/6] misc: Some inclusive terminology changes
Date: Thu, 10 Sep 2020 09:01:25 +0200
Message-Id: <20200910070131.435543-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: R0fvAjHcJT6f

We don't have (yet?) inclusive terminology guidelines,
but the PCI hole memory is not "black", the DMA sources
don't stream to "slaves", and there isn't really a TSX
"black" list, we only check for broken fields.

As this terms can be considered offensive, and changing
them is a no-brain operation, simply do it.

Philippe Mathieu-Daudé (6):
  hw/ssi/aspeed_smc: Rename max_slaves as max_devices
  hw/core/stream: Rename StreamSlave as StreamSink
  hw/dma/xilinx_axidma: Rename StreamSlave as StreamSink
  hw/net/xilinx_axienet: Rename StreamSlave as StreamSink
  hw/pci-host/q35: Rename PCI 'black hole as '(memory) hole'
  target/i386/kvm: Rename host_tsx_blacklisted() as host_tsx_broken()

 include/hw/pci-host/q35.h     |  4 +--
 include/hw/ssi/aspeed_smc.h   |  2 +-
 include/hw/ssi/xilinx_spips.h |  2 +-
 include/hw/stream.h           | 46 +++++++++++++--------------
 hw/core/stream.c              | 20 ++++++------
 hw/dma/xilinx_axidma.c        | 58 +++++++++++++++++------------------
 hw/net/xilinx_axienet.c       | 44 +++++++++++++-------------
 hw/pci-host/q35.c             | 38 +++++++++++------------
 hw/ssi/aspeed_smc.c           | 40 ++++++++++++------------
 hw/ssi/xilinx_spips.c         |  2 +-
 target/i386/kvm.c             |  4 +--
 tests/qtest/q35-test.c        |  2 +-
 12 files changed, 131 insertions(+), 131 deletions(-)

-- 
2.26.2
