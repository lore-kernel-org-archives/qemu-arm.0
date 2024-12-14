Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp933931njb;
        Fri, 13 Dec 2024 22:33:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXZM6pkszVKYjMXWeL6KFxbpCRv8hfAQj2pfcg8tSZ7cqwMmH1Bf2Ra5pSCLSbx+GOvgClnNhSiXFAnHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFmVBhzbErFVkOLYEgJZ7fnzexjMut7w//UaNpLDrdq0fED0qsqKijBa+HMGhuq0Zkmll+b
X-Received: by 2002:a05:620a:6005:b0:7b6:c714:f65c with SMTP id af79cd13be357-7b6fbf14f9emr808382185a.28.1734158029250;
        Fri, 13 Dec 2024 22:33:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734158029; cv=none;
        d=google.com; s=arc-20240605;
        b=PHW3+9a4ssXuGKKS6bcP5DjdtWb/oBgIwAEMWG72AA0PEpixGYDnlJsCetGj8Qidlc
         4NRRrnWHKNuQ9fAigG8YCAk0cXE5wUpBHRH3y6HgzXUhOy1EPYHIc3hfuirwoTrcVtIT
         2c7afKiqbC8YQiGmWYUbPSNO/53yah353hstjLYSEdDBxqi/LLGDAVaeK6saYdT0ED0J
         1/FZ1AtccwrQajlBD8F9i48eTqKiOkRobQdtSx7E8YKgkkcA/Fj/Qm7CEa4ZKoDPJOYL
         xqdnYrjHo16dz/cfYpZWIMN3NvrGeajtYFUqOD1lYR+xg1HVPsSiJaFZfoiiM/mHAY2S
         mGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=hXB3aILzxYyhasq74XESlYudpMNoJDXe3iwsEWxJQEU=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=h5degp3oi8QyH1XDeudOBCRzBv+RYuWBZbTe7nsoz7AppVEMfarz9Aqtac50bj5yJR
         9g52tZUFO7Fip4UaUeXo2osjBMdu8ob/XgmBnek6R0FI7RMW3nTTkLyHJqMbyLiXjxfW
         gKZ5+XzRhlmRi4+7eenH0Sv0F2EXwsa1OKx9cLmNciSjNp6v6zO+wmcD5GEej/rice4d
         Ey4exqgbeHkfnB5uBKyb523joZMfqdZMYoPdL3JFAGBN/b1a5ordTyJzL+VN6cNJ3xA0
         RHZTaJfAFsRLJ+TOhHhzIrjDiSwIC5KvOuDBj2iEWU4CZ0yLGzcjaHtxb82PWkHvwosP
         sjSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="XqO7G0/Z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b7047ca25asi134635085a.73.2024.12.13.22.33.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 22:33:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="XqO7G0/Z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tMLia-0003Sf-O7; Sat, 14 Dec 2024 01:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <effbiae@gmail.com>) id 1tMLiZ-0003SU-JL
 for qemu-arm@nongnu.org; Sat, 14 Dec 2024 01:33:35 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <effbiae@gmail.com>) id 1tMLiY-0007Tt-5n
 for qemu-arm@nongnu.org; Sat, 14 Dec 2024 01:33:35 -0500
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-844e1eb50e2so76161339f.0
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 22:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734158012; x=1734762812; darn=nongnu.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hXB3aILzxYyhasq74XESlYudpMNoJDXe3iwsEWxJQEU=;
 b=XqO7G0/Z8pFBXde1VonjAWSe45qv+GXJ2vtC8i1yWrEvp47WjRE8LaqUj4Dnohao+P
 GPPBPlD0yj9U6IKD1sTDTlwyMwXXUUbxoJqsv6/CYH0uzjdCdtLiG5MRrKryeU4TVYgY
 LuIdAATc/bH2pHNwRullv7AFt0XuNYsZoSvHrMLhhVRPJKtMlTuvu8mdGaFLGy4TtSOX
 5PbRbPxCSf0PnwkgLHU5enVZ2X/5zcvijKdoal3xOvIoNvzle9D52P5tIZY7+MZBziAL
 PeW5lX/tH5NZq/6DpjsvdJGitrxfAeBd5B78iH5XYxBR1XqIyjv6VC5wRalDWbO7p0Cf
 tD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734158012; x=1734762812;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hXB3aILzxYyhasq74XESlYudpMNoJDXe3iwsEWxJQEU=;
 b=AzJN0zyUY7pZtS+i50eKAKHpZI9/HlETcFXudsCMrkCpmZmUAy36FdHMK4rHyYjRN0
 BRFv8X3cvmr+WrnY5xM74IB47Toy2rwdl8moa4xL2Y0ACK/BllRu4i9S181FofSYOWBn
 5IAKpvRG0LLBVxsHog4JOra+rb37rTveNqCzKSAMlMyz4J1KUAo46lAvRR9YxU89s5oc
 YJcVbKnSSnupLEb6W8olk+802Rob/2LnLbUlsKH3ESAtn9QZBeyDjnvaMOLV/9nntUZT
 9yGIihbqKhsIjavuDe/yWxNq4l5Unw/gwX4iM1x2vpcPwSnEdPCEah29NLhT9/wtR6JO
 xw/g==
X-Gm-Message-State: AOJu0Yy/NcMc9uaJGiAX5C1L9lmol00RVC7Fx4/jLRjizF6PH8n7tHle
 2WaT0t5I6XvM27JCFNOBk/GPnBD/TjSdIe/s6xnxXimd9OJkwF7KSNLbQ27KwFRqyPSPFxPyAiu
 y1x8+HmH83csI0KmlgKo1oryQ3UUpTTW9
X-Gm-Gg: ASbGncvuBZoMGa+VDsy3SWrHy+pYBl+yUDPsZ3W+aEAdZREZKF8i2ImOaRfROwMxiTx
 GaxcH0LUnGrQXicuVzFz96m+i0waM7p8zAPIG
X-Received: by 2002:a92:c566:0:b0:3a7:7558:a6ea with SMTP id
 e9e14a558f8ab-3aff01b0779mr59399045ab.10.1734158012599; Fri, 13 Dec 2024
 22:33:32 -0800 (PST)
MIME-Version: 1.0
From: Jack Andrews <effbiae@gmail.com>
Date: Sat, 14 Dec 2024 17:33:20 +1100
Message-ID: <CAJvHTNyYaXECmn7AkdbpAhQcSySndiCqwiY_ZmyjeJYs7edghQ@mail.gmail.com>
Subject: Raspberry 5
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000053599f06293520e4"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=effbiae@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ql/Af34S/jpa

--00000000000053599f06293520e4
Content-Type: text/plain; charset="UTF-8"

Hi qemu-arm,

Is support for raspi5 planned? Or already implemented? Do you think if I
develop for raspi4b, it will work on 5?

Best,
Jack

--00000000000053599f06293520e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi qemu-arm,<div dir=3D"auto"><br></div><div dir=3D"auto"=
>Is support for raspi5 planned? Or already implemented? Do you think if I d=
evelop for raspi4b, it will work on 5?</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Best,</div><div dir=3D"auto">Jack</div></div>

--00000000000053599f06293520e4--
