Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp704663njb;
        Sun, 8 Sep 2024 11:36:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVz/28hu99wwhhdhk5otDSY6H0bTeSQR8hk1mDd4NIzJg24NXG+MLchbNZBxCvEQJxxOCKAfB/5syReCw==@linaro.org
X-Received: by 2002:a17:902:f60b:b0:206:9dfb:3e9e with SMTP id d9443c01a7336-206b832146bmr231593155ad.10.1725820581889;
        Sun, 08 Sep 2024 11:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725820581; cv=none;
        d=google.com; s=arc-20160816;
        b=H7CWC+Z4FbTnaUWCQu5oQ7OFoVV5tcktZEz8/lvfR4OHAbZ1O4GUUzdUOxoqM93m2P
         37kVdojbjPS6XuM5IuyFa1WiZbKJG0YzDT8dkK3F8oc3kNbRWLmCPjhcluUGMyIth2m2
         QbcMMi7ACnqRL2EVvDKVYCYFecU462lVzgByLdSU79//MxJEFD0mmhxIjvxBvHUrTdW0
         Ii/c1ETcqFB55LVpipQ39n0DKjI2Uc7wLdPjXHLz4ZyW23I3Q7EfJvOG0Y57bzVO8hI4
         VqGgXRyaMcvSgkptySvsYIuaVGH/POCAqlqS60G5A+aRSolS2F2jeLm2/FhGa8HTTyP0
         SFQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:dkim-signature;
        bh=fTYiG37Se0sbkN/Q2JONvnr1L/pNa1lHcmOyWXcl2NQ=;
        fh=aK4O7o4SkBpUpfxYkJygq/DrjPO4U+uvA6MqSUaA9WE=;
        b=LLu4eM5t3nPBYR0tkmBUqkLngF64yx7JFfWWRBTb0s+UmzKgwH836C/t40ZslSSJK2
         o59Pqv74bVKHAnN+YplYC+8pLf+QhstmfT7aQuBnwrFPB9MVwjJSgKsGN82C4i0SYgih
         hivnIxvnkP+qpwA8nTsu0UDH0NSiyXOKa8JQH8dzuuINDijJFbe26R6wcZ7HI2tbh3YV
         pmZXCoUCWAMeDK7kD16An0m0EWtKb96iiAU1R8z/r1pt4V2SZCqS68t9uqp0q0s1BZkf
         6ZvFSOU2IiFarM9GFJVHMV1vSSNn/+HX1+YZvJI4HERun39sL0EJkLHCY4WL2Hk/CAW6
         Tf5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=loEO9sVA;
       spf=pass (google.com: domain of groeck7@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=groeck7@gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <groeck7@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2070fc8d4d8sor13152675ad.5.2024.09.08.11.36.21
        (Google Transport Security);
        Sun, 08 Sep 2024 11:36:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of groeck7@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=loEO9sVA;
       spf=pass (google.com: domain of groeck7@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=groeck7@gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725820581; x=1726425381; darn=linaro.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fTYiG37Se0sbkN/Q2JONvnr1L/pNa1lHcmOyWXcl2NQ=;
        b=loEO9sVAebZnsb8tlqYPYftThvcngpd43besFlUqo0piNkTVHM4FRX5FDJc+gsutdG
         sP4JoWWPjWBKqcfkVgZlfKKO6MDmLoYcy5ZAPZu7jQMF5LFU5W6vRBwsrtI4av+rzQhF
         EiTfslcc1HLW78D4xBLAKfYqoMwIjsX83RHkd2BuSvA3i0ONQ6xM7zaAG0L+nioLBhah
         tH0tGzoCg87xFWlbKOnKk3p4HfNpBtpGU+L6N103DSKfa8QfblZ+CKcL7D+KOcoBUau4
         rOwZUssqotgGdDEesEbEr+0yDHYOxSWGpxGbOkLhD+/P5BTtr3sdYUlfxTdGshZSHlfK
         oofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725820581; x=1726425381;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTYiG37Se0sbkN/Q2JONvnr1L/pNa1lHcmOyWXcl2NQ=;
        b=xOS67ucwy8IwUjef6u5CID4uXuLkH1On/SoknbIuJftFfMUA5nQClUgdqWXdfAkOtQ
         PMy9lolgJjMlsKTK2yJP4LttG9QdFDm42dX7MhdgrGjxm/l5htfa5uaG3gXJLtPdR96S
         /C2nD36vyxrEjlBvG1b2a7WobPZVfYq5lPbAbWr1YYtfG2xYvNkm+0HWu6RjjGeeXo6/
         CIGXbE6jR5g3Tj1HhzSc6SuWsco4ZVSKqPreLw2T42wdmZK9sCkB8KqtMrNDRXjqWiYJ
         t8wNv6jc08i20Zcb7KMym1OtePAV8Gb/00fpEdW7CodgtV9IgKQ6yogcDGTTiEoxUtwY
         Yfcw==
X-Forwarded-Encrypted: i=1; AJvYcCUkNY5GAXNhNvKrX+VgkDcL/LbpubH5wMGMZlR8KThbISiXjNka9eIU8gbPQLzCs50An5IAC10/PHg6uA==@linaro.org, AJvYcCVLyYTXA60zsOKEGb7PJyTQhgHEsZzi1oDC34Q62jcPEbhWY4uA29GCtYE8aj7+u1tDIc9bB2btSinVlRWQkA==@linaro.org
X-Gm-Message-State: AOJu0Yxt92pppHgGcZyN98f4qsQlkHtwQqYnKmu8UU9uQsitxRMsVQGk
	AmWqVKiDjX532SFDW4sYKtGtADLE/ulEr3MO6M16cYYMQZNQcrEENytgHw==
X-Google-Smtp-Source: AGHT+IGjvp4TWbtVScWyKwCXT8WsP39V98eVYOpzm6Odw1Aevl6SrZVma2G6plCNRzv/MDKkuuKDwQ==
X-Received: by 2002:a17:902:d488:b0:205:5d71:561e with SMTP id d9443c01a7336-206eeb8ca5amr124470175ad.26.1725820581050;
        Sun, 08 Sep 2024 11:36:21 -0700 (PDT)
Return-Path: <groeck7@gmail.com>
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e16fa5sm22261205ad.55.2024.09.08.11.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 11:36:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 8 Sep 2024 11:36:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: qemu emulation for USB ports of Allwinner H3
Message-ID: <85f61ad3-da14-43f7-983c-62053ce0cfa6@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: YqpQmxv0HvrE

Hi,

the Allwinner H3 USB port qemu emulation creates separate USB ports
for its EHCI and OHCI controllers, resulting in a total of 8 USB ports.
From the orangepi-pc emulation:

# lsusb
Bus 005 Device 001: ID 1d6b:0002
Bus 003 Device 001: ID 1d6b:0002
Bus 001 Device 001: ID 1d6b:0002
Bus 008 Device 001: ID 1d6b:0002
Bus 006 Device 001: ID 1d6b:0001
Bus 004 Device 001: ID 1d6b:0001
Bus 002 Device 001: ID 1d6b:0002
Bus 009 Device 001: ID 1d6b:0001
Bus 007 Device 001: ID 1d6b:0001

The SoC supports EHCI companion interfaces, and my understanding is that
it only has four physical USB ports. Does the real hardware instantiate
separate EHCI and OHCI interfaces (for a total of 8 USB ports), or does it
use the companion functionality ?

If the real hardware only instantiates four USB ports (or, in other words,
if it utilizes EHCI companion functionality), would it make sense to
reflect that in qemu ?

Thanks,
Guenter
