Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DE3CD4F26
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 17:00:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wacZI-0005G1-B0; Fri, 19 Jun 2026 12:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wacZG-0005Ft-Bi
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 12:59:46 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wacZE-0008Du-Nz
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 12:59:45 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65JDCI8i746380
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 16:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /rptLxo4eREh2ocZNUqCVbv1QjGFQnWIxB+4ZY/g3tc=; b=kBitzik2E/bcpm0w
 rWw83jiRUbnKqpPFTBkrEDWLdwFYK9OlGaTYfNuPxXHEidPjoxuzVNlh0DOXFBYj
 6lpLPg7oePQk+HVKjSnqGCrAkGOuKuDrHzMsYBy9elsxMVsZII/KTADw7kbDoo+a
 1fW8p6xdf+hTygHjt85z/6Ky/JUy1va4oX7oDGAx/e19uzlJii8ydX7uGr2YYxuW
 KgOS3z5HDyJqgcW/CJ23jUsUFj4WkwXBpxBbcy1AjdWWB86TJUqnkf/elDbYk96M
 WX1ro0AxdbsODaXT7h85gTcQVpHYrKl1KafotyNzfcpjaUknHizcCpy40ND+WJ77
 HbQfvA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6sc738-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 16:59:43 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-139871a52c2so3677427c88.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 09:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781888383; x=1782493183; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/rptLxo4eREh2ocZNUqCVbv1QjGFQnWIxB+4ZY/g3tc=;
 b=MOCciDsyiBjJmbavZAZhq/lEUPuzF1gqFeVwCkhVjl9dGnOtmbJL5sBUIFvRw8sGAH
 eeRuNxF86xbSh4Z0N7QAu03extvQWdzoOfiWHfEkYrWJb5jvhsXCnWrqDDBBC7KdRbEz
 c3snLDKjCp4pODXwfjB4oVvR/80PqNSCwTt6dcobW0Wx8YNlPwQoX4irx3ujyb3d1R2D
 iBZY5K9LZIvJPAOMi18BXg5jqI6OX5gP/N17DwblXon3VC4q3/hM5XOjLyr/AyN9Ljlo
 ChFIfewl3w+vYC9JH3tdHNvHzgdMN9TGwzywXvjfNsFDFXInPBBR7VibtjFus1T1YS/W
 jnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781888383; x=1782493183;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/rptLxo4eREh2ocZNUqCVbv1QjGFQnWIxB+4ZY/g3tc=;
 b=UFE2ySqTUTN5RjH+aIpMjl5+Pr83s/xL3WXhWR4A1AnWFPTTiqYP8tB35Axs+LFHUS
 bwCWuyS5BmeFjd6uyVZIaCPb93eyoGxzGvHrIstyen59Ugfh2AacK7CzJyJOl6MLLh4P
 SrMdljl2t/AADjxIiOhWGy7aHZwp5a7sadpsyFMvzgQbJFPBwgEllbbz+8YKCo96e8+U
 KVkpIq9xyiNlNARN830PpInCeaQl0JEu6tDH3cjBKusERYhGJuSAekcTXPUkB1SczRhU
 QZtashhB6DDWVGBpK4bUFKYNP0Je9dMlb/gejcEUQ9tGMPbQ31YIXNgIXxObVFBlzSpl
 AX8g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+9Y/F1IZevzRdL+UB3rYBG5LjqsjeETU5fj44rM/uMkOoo1jhrefnIpCLnzTbeUUN3u/LH8kcjSw==@nongnu.org
X-Gm-Message-State: AOJu0YzHNX6HOxARUNsQGJz8Zd00+W3HhHh3rPvH3KINQze5m7N/WShU
 tSZvlI+68w/Ni60ASYtaDn55lrv7R+0Zx/Sc9o7CWK5xttcK7BA8H3FMVtX5cMAaMu7NG0tprU6
 xfmikbqtDG+uA2MW2N6uzz4mtmsq07Sqm99u4dX+d2GILjPOGyCN6Kfg=
X-Gm-Gg: AfdE7cn787NCrr8EO17ghV/4Fa/29U9MyugGeNKeSwCBtoJOf4gVGRGkn8SjWtIfyej
 ErDM6EktY2+4lGQw9QZRKF/IdLiLkfI34CYQkhSE735tj+ij4izOyMDtkp+3mVoSFH3tk4Btnam
 5Pb2Gsem7ZuahAE8VemVW9cSQB9MK5ecWZlbBZTrucq3upGC2J/jx3foxOSs9/A+616Vs5n1Szp
 Myqy6qK8bv9+j1mUKm9S8NPreuxbQJ4pXcoJ/Rt6XHNV7TcOxEvEEuWUNVr7fzMqnwMHqyqNoR/
 5fJ5in/SuKSh5xIUNZxOufx3ECVZMS9gtts3f8skc+YYoDYe1E0lRnPX0semi/CCJoqXKCZHJJ+
 Cb/gn8/yAe7HBbHZ1o6RiUTfJfYlGWeoLBSPqIT4TkKj1tSvRjWrc/33a39GjS2e4ZHfVJKHbs3
 SmF/I=
X-Received: by 2002:a05:7022:98d:b0:139:85c2:d7b1 with SMTP id
 a92af1059eb24-139a380ed56mr1760195c88.15.1781888382597; 
 Fri, 19 Jun 2026 09:59:42 -0700 (PDT)
X-Received: by 2002:a05:7022:98d:b0:139:85c2:d7b1 with SMTP id
 a92af1059eb24-139a380ed56mr1760181c88.15.1781888382113; 
 Fri, 19 Jun 2026 09:59:42 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-139a34bdc83sm2283596c88.8.2026.06.19.09.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2026 09:59:41 -0700 (PDT)
Message-ID: <6ad6a649-eef9-4c73-9872-095045ce70cb@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 09:59:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] gitlab: update bug template for sec issues & tool
 assistance
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Brian Cain <brian.cain@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Cleber Rosa <crosa@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>
References: <20260619155657.944220-1-alex.bennee@linaro.org>
 <20260619155657.944220-8-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260619155657.944220-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tQMhuX_tFQLkZWhl3f7dq0EXu7dxYlgk
X-Proofpoint-ORIG-GUID: tQMhuX_tFQLkZWhl3f7dq0EXu7dxYlgk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE2MSBTYWx0ZWRfXzhecvDcFCiAI
 raz+620RQeltlQeW9bQBZ0CdnOOQsDfF34cDVIqmcJEQ+tGexFQAfkL33BHCoPl70ZpqOpCar28
 kUlthwOQAkEKFngkAlXfQNwuoeSmITfgS9gelmQ28BVL0MxVnHO/W68fYhcsHFtAJCJ7dN6Brlb
 mJ2Wxwpwj719do9Z3nT6ejyHkSU1eCY/t3/Na9RV2PcbWRskjw6dxCwzxkgF/ktFY5Bp0pVj3R8
 wHvLT4e2CpK1RfqsDnV+syLkB3cWpKuYqQks85eqA0Ra8hFcJOumDytWE84s3BDbSf+VOTIm/7M
 emq4uQe3I0lR0t/XywgaFnYsDLHVL/knaUJQK+OV1tzQB+VWk2NYL6+jDQgAikfF8lWVaQ21XHu
 txw4HGHHvDvAMTXzIT7sf2gOVBv4ekNPAyK6G5AbPQMWjkBJY/5roNJdMVdI4euUtVqGJHlFOFw
 PTrSUOVXNBnSV5cz6HQ==
X-Authority-Analysis: v=2.4 cv=H6LrBeYi c=1 sm=1 tr=0 ts=6a35757f cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3OaHR_JGh9pDv8ucrEYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE2MSBTYWx0ZWRfX7z8a3ezty3kg
 NO0BQP4U42kTMoqVRv7UJ28sf2jZ7vzIqBKmjiKdfZZPOvhGbQODjRhJJHNsEVeL2N/AzUTZpGW
 vQpMMyaAwIL4xEPlZxRkNcLi8Rvjb5w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190161
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 6/19/2026 8:56 AM, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> Warn that a security issue must have the "confidential" flag
> set and that any findings from automated tools must be validated
> before submission.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-ID: <20260619123632.1276476-1-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab/issue_templates/bug.md | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

