Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp505945dyc;
        Thu, 3 Jul 2025 05:39:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVP6r1/A7L7cGeBZYnp5SYeB1lQwewiFZNZQZiIf+Ny0C0LRlXimoouqwHy7a/n9zkThMw1CBMATwQIWg==@linaro.org
X-Google-Smtp-Source: AGHT+IEsr+yrpPzJiWILgAVcZGM1wNlBcu/pBbvgc8faIgNUNBxFMElOUOkKTieel9MrdEjldBNv
X-Received: by 2002:a05:620a:c4b:b0:7d4:5830:4064 with SMTP id af79cd13be357-7d5c4703d53mr802371785a.11.1751546361505;
        Thu, 03 Jul 2025 05:39:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546361; cv=none;
        d=google.com; s=arc-20240605;
        b=L7ZbO6Jzmy5bHZ3ORo08sa45shjxtNs83TDYRVmClOkiQSyzr9tUh+mW3eyEV7IleL
         rWsp7pa3Z9HAU/K8mpA7xjAUvTTfyFFhsPkTwOU6FldJBu7rLvs9GFIYGFO68435ZjBp
         Kh0q0Vh0lGa5WXF2mI6wuXlpCFIFeYQXfs+QzjeNaF7Ephwm0cplSfGPz0hdwu9NqwZj
         jNg8JUwYFu359I0NT7IGJHre5lV7Hx6DwEKfYYjYqFNYZOY7ZVIMx8nI9X+TfT4ASH2H
         NiXdFoZ8BmJYxHuUZDdx/S7z8ECThDShqNKi4SBI4VgL9BNuHrKqLiPRNAp7aG/ZY5e2
         bIQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aied6IMtrGNeEei91xtIjb3dgzJFDwM7XO3g8IWdCiY=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=IKa+PvcoxCudfstyzmtZVnmjqS4kUR0z514XLk+nJoeAgJd3kmQGwpcK09WLRJSM9w
         zs/Q47VR7oubloNf1Lr9T0URookmIX3dozvAuvoB2cIM20RKxTKtoi2wLfFQGkY474sF
         U4Ur4xQ1mQxkEM7UP7FZNQn+JH/B+MddlNpWfHMAX+s9ceGWMN3B+2WkzSiTtKrd7kwZ
         I4JVoDVNicv5/WFwLnt4KJ2bS32GVTF0Rx5heIr+qdpKcB/RpJJ9WmImahW5tV/ws3KT
         8uWgdsoGHLNWBpfX5sRRw3w8T/fie8K12laVvcyhwwnjfXhtxN3zQVgKnbSXWU9eDd4p
         ppQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hXiBMmPy;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fd683b4bsi145065611cf.655.2025.07.03.05.39.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:39:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hXiBMmPy;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aied6IMtrGNeEei91xtIjb3dgzJFDwM7XO3g8IWdCiY=;
	b=hXiBMmPyqISkzAL3yMmhwipXRr5WEbwGuEjny2KqRNog5JZfWeQbUVcWSzPMzoYlKNgZL/
	gWqHPQNmvHa+hu5bR7chzCLH8ClLXXpzb2bB3rzlWdL4jybkhhVNEHZwFMWaFERQOZugw3
	q/Kyq3dxDhww+g3kpBnMGxRzhnFQVhA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-417-xcrtr64xNOSH9S5_ySCALQ-1; Thu,
 03 Jul 2025 08:39:18 -0400
X-MC-Unique: xcrtr64xNOSH9S5_ySCALQ-1
X-Mimecast-MFC-AGG-ID: xcrtr64xNOSH9S5_ySCALQ_1751546356
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9955F180028D;
	Thu,  3 Jul 2025 12:39:16 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 27F79180045C;
	Thu,  3 Jul 2025 12:39:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	Jonathan.Cameron@huawei.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v5 19/36] qtest/bios-tables-test: Generate DSDT.viot
Date: Thu,  3 Jul 2025 14:35:19 +0200
Message-ID: <20250703123728.414386-20-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: CoYsberraKLd

Use a specific DSDT.viot reference blob instead of relying on
the default DSDT blob. The context has not changed.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/aarch64/virt/DSDT.viot      | Bin 0 -> 5158 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 7a74beab3d..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/aarch64/virt/DSDT.viot",
diff --git a/tests/data/acpi/aarch64/virt/DSDT.viot b/tests/data/acpi/aarch64/virt/DSDT.viot
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..acab6e65febbc210158d4c39be0680bbb90250f5 100644
GIT binary patch
literal 5158
zcmZvg%WoT16o=2)6MH;<Wc*0%I8N+Bsd!dnyJ^zWmfB+{aj_HQNgE_rawJql$)*w&
zQmK&AELzBpMq(YL{vk-LkXW!|(KQ?X0d^SOc{t~%o>|y)ALqOG8=sMmZ^!NIT`CYo
z{%G$y+itD>`OvA=YBi0B)V=z)p54~&Pu%uod|Y;H+cqZKy-vF2412b1uahyk+w0Ky
z_`0(@2**Z)ZQHKbgE3>`jNEM5EIv<=0w%~J`Y}eDc7ceV(D-;`bKlwYxu10hcWv8l
zkTG%hT4vIiI8ICR5m__iBO-}X5ZTi2jlwPUcSgImZLgg#JBvJD+@wgbxXlrDe|1Et
zW#2$V7@{5^+G-aK31LPghRzrb&S;8^sKkgdMw2tHhzwm~7>sd+GuA}LoWw90V~sPe
zij0`VNHNA$&R7>2afy*(jCIb~5E+KVuoz>5Gp>n@gv7`(#x=&M2QLSvm}yFk0%Kg~
z3^7gdB?(h~kug5z3^`9z(mqOzaf37DJWWfCGGpB23^`9T5~IQxw>U%2(|L)p${3$;
zhMcFC#HcaGZO)MMG%GRQVvH7N$a$KR7#A6%%^7l@<|W1@#&8&;A?Im9V!X>39nO&R
zbU|Xg&lp|Kkn?m=VtmLLo17u%X;ETaW{fS)kn^-8F>J=z<_tMcmn24mF?yUK=V@7D
zTw#nmoFV7wvc$N`7@u;6oTn9uvB4O9&XDtTMPgiMi~(ab<vd-L7&jPWhco0ntxAkr
zjIkRqdU}6W5Dj;RwqtM3ijU#Q&1TG`SLeL#&G(BK>?_13?#R`~J}TG_pfm$e7X_5x
zH$&Y~y9(YOK&fJcZ|fa_<@X^gc#Dt~Mb;&O<@cSlUJjjJ@T)0S%id7Wq}K^rO;z)C
zx5${Z+dH%8=<bcORkJcAhkEpYYGhN5I`n|PrHAwdJs?sLuS^?`_VWF2%%faVPfn+#
zejD=dwZ3iFDVI|HW<))nuo3Osc9U{xJvE(bq+;r`mWpanF5{1Ran19linN2d5ihba
zYpKX^YQ&GUgUASZk>M&)FEZRg)Qb$KM*YZo5E=C&!&P)IGTedgMTS##KQi3B?nj2J
z%z@_|c+R2coF5sk5(Cc|c*f8(hMsZojDu$!J>%$UfTsbT26`IknE=lOcqY&@fu1IK
zn&4@or-`0P@Jxbd5<QdXnF7xgc&5-Zg`R2fOoL|{J=5r!0nZG0X3#T(p7Y>251#Yr
zIgg$ecv|3Tp{IqOS@6t)XBIuP=$Ql09C+r?Gl!me@XUi}9zFBuSpd%hcoxvJfSwEB
zxd5IE=(&KNi{QBko{Q+Yh@M68EP`hdJ&WjB0?!h7me8|=o=f1l1fEOixrCl&@GOI8
z89mGBxeT7m;JJ*R%jj7F&kA@}(6fS`E8w{To-63Nf}X43xeA`E=(&oXRq(8WXB9oG
zp=ZIGIPDg_%BWKx_5a4NShnNl;~&x#Ns+py>O*@`Buc5n9CcaK>3`~PnHs(PqDWdQ
z>bHod-t_4$B8^TyU@_ix<jt7+lh~#DpHQJ6pX|DhesV}oXTN^7Gk5w`Hg8(v!RzL~
z)ynOk_aC=@z4_OdCx@o)boLu3ho<3l_M4B?$HCJBvwCo5y*z!WeXqj3vHDs5<*7I9
z_gQM>(ShpuCFOT1RQ=Uq;iE~%9q4Bl{5Ahv|NU=w?YqHG#eW7%zd3`m#Oc@cDjU@_
z^+Ds~fj;WGthjN!BP@0B)imul%)O^OoldLjDYMH`_v%Ef9lw8Bow;pwI}`ux!9Q@T
zt0L)cuan;DcA%h)YVY}>N8M3(i&8{J!qmsllB(%+-EO~DSebP1?Ij+m#=)6&`t-n5
ZwaN40{-|vpjgObqjlY;*>N!CX_CM8!>@ENR

literal 0
HcmV?d00001

-- 
2.49.0
