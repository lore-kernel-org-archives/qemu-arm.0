Received: by 10.25.27.66 with SMTP id b63csp1848232lfb;
        Mon, 6 Jun 2016 23:41:28 -0700 (PDT)
X-Received: by 10.55.155.193 with SMTP id d184mr20297494qke.152.1465281688855;
        Mon, 06 Jun 2016 23:41:28 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i38si14369226qte.47.2016.06.06.23.41.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 23:41:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAAhc-0004mm-CF
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 02:41:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bAAgm-0004Uc-DQ
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 02:40:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bAAgd-0005oJ-6O
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 02:40:32 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:34793)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bAAgW-0005jm-55; Tue, 07 Jun 2016 02:40:27 -0400
Received: from 172.24.1.36 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.1.36])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DLV86180; Tue, 07 Jun 2016 14:36:03 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml426-hub.china.huawei.com
	(10.82.67.181) with Microsoft SMTP Server id 14.3.235.1; Tue, 7 Jun 2016
	14:35:51 +0800
Message-ID: <57566B31.10905@huawei.com>
Date: Tue, 7 Jun 2016 14:35:29 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-3-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1464274540-19693-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090204.57566B56.0084, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 08bbfe4d27b15ea36befb6d593d451a4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Subject: Re: [Qemu-devel] [PATCH v2 02/22] bitops.h: Implement half-shuffle
 and half-unshuffle ops
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OGy0shgDfmhj



On 2016/5/26 22:55, Peter Maydell wrote:
> A half-shuffle operation takes a word with zeros in the high half:
>  0000 0000 0000 0000 ABCD EFGH IJKL MNOP
> and spreads the bits out so they are in every other bit of the word:
>  0A0B 0C0D 0E0F 0G0H 0I0J 0K0L 0M0N 0O0P
> A half-unshuffle performs the reverse operation.
> 
> Provide functions in bitops.h which implement these operations
> for 32-bit and 64-bit inputs, and add tests for them.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/qemu/bitops.h | 108 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  tests/test-bitops.c   |  68 +++++++++++++++++++++++++++++++
>  2 files changed, 176 insertions(+)
> 
> diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
> index 755fdd1..15418a8 100644
> --- a/include/qemu/bitops.h
> +++ b/include/qemu/bitops.h
> @@ -428,4 +428,112 @@ static inline uint64_t deposit64(uint64_t value, int start, int length,
>      return (value & ~mask) | ((fieldval << start) & mask);
>  }
>  
> +/**
> + * half_shuffle32:
> + * @value: 32-bit value (of which only the bottom 16 bits are of interest)
> + *
> + * Given an input value:
> + *  xxxx xxxx xxxx xxxx ABCD EFGH IJKL MNOP
> + * return the value where the bottom 16 bits are spread out into
> + * the odd bits in the word, and the even bits are zeroed:
> + *  0A0B 0C0D 0E0F 0G0H 0I0J 0K0L 0M0N 0O0P
> + *
> + * Any bits set in the top half of the input are ignored.
> + *
> + * Returns: the shuffled bits.
> + */
> +static inline uint32_t half_shuffle32(uint32_t x)
> +{
> +    /* This algorithm is from _Hacker's Delight_ section 7-2 "Shuffling Bits".
> +     * It ignores any bits set in the top half of the input.
> +     */
> +    x = ((x & 0xFF00) << 8) | (x & 0x00FF);
> +    x = ((x << 4) | x) & 0x0F0F0F0F;
> +    x = ((x << 2) | x) & 0x33333333;
> +    x = ((x << 1) | x) & 0x55555555;
> +    return x;
> +}
> +
> +/**
> + * half_shuffle64:
> + * @value: 64-bit value (of which only the bottom 32 bits are of interest)
> + *
> + * Given an input value:
> + *  xxxx xxxx xxxx .... xxxx xxxx ABCD EFGH IJKL MNOP QRST UVWX YZab cdef
> + * return the value where the bottom 32 bits are spread out into
> + * the odd bits in the word, and the even bits are zeroed:
> + *  0A0B 0C0D 0E0F 0G0H 0I0J 0K0L 0M0N .... 0U0V 0W0X 0Y0Z 0a0b 0c0d 0e0f
> + *
> + * Any bits set in the top half of the input are ignored.
> + *
> + * Returns: the shuffled bits.
> + */
> +static inline uint64_t half_shuffle64(uint64_t x)
> +{
> +    /* This algorithm is from _Hacker's Delight_ section 7-2 "Shuffling Bits".
> +     * It ignores any bits set in the top half of the input.
> +     */
> +    x = ((x & 0xFFFF0000ULL) << 16) | (x & 0xFFFF);
> +    x = ((x << 8) | x) & 0x00FF00FF00FF00FFULL;
> +    x = ((x << 4) | x) & 0x0F0F0F0F0F0F0F0FULL;
> +    x = ((x << 2) | x) & 0x3333333333333333ULL;
> +    x = ((x << 1) | x) & 0x5555555555555555ULL;
> +    return x;
> +}
> +
> +/**
> + * half_unshuffle32:
> + * @value: 32-bit value (of which only the odd bits are of interest)
> + *
> + * Given an input value:
> + *  xAxB xCxD xExF xGxH xIxJ xKxL xMxN xOxP
> + * return the value where all the odd bits are compressed down
> + * into the low half of the word, and the high half is zeroed:
> + *  0000 0000 0000 0000 ABCD EFGH IJKL MNOP
> + *
> + * Any even bits set in the input are ignored.
> + *
> + * Returns: the unshuffled bits.
> + */
> +static inline uint32_t half_unshuffle32(uint32_t x)
> +{
> +    /* This algorithm is from _Hacker's Delight_ section 7-2 "Shuffling Bits".
> +     * where it is called an inverse half shuffle.
> +     */
> +    x &= 0x55555555;
> +    x = ((x >> 1) | x) & 0x33333333;
> +    x = ((x >> 2) | x) & 0x0F0F0F0F;
> +    x = ((x >> 4) | x) & 0x00FF00FF;
> +    x = ((x >> 8) | x) & 0x0000FFFF;
> +    return x;
> +}
> +
> +/**
> + * half_unshuffle64:
> + * @value: 64-bit value (of which only the odd bits are of interest)
> + *
> + * Given an input value:
> + *  xAxB xCxD xExF xGxH xIxJ xKxL xMxN .... xUxV xWxX xYxZ xaxb xcxd xexf
> + * return the value where all the odd bits are compressed down
> + * into the low half of the word, and the high half is zeroed:
> + *  0000 0000 0000 .... 0000 0000 ABCD EFGH IJKL MNOP QRST UVWX YZab cdef
> + *
> + * Any even bits set in the input are ignored.
> + *
> + * Returns: the unshuffled bits.
> + */
> +static inline uint64_t half_unshuffle64(uint64_t x)
> +{
> +    /* This algorithm is from _Hacker's Delight_ section 7-2 "Shuffling Bits".
> +     * where it is called an inverse half shuffle.
> +     */
> +    x &= 0x5555555555555555ULL;
> +    x = ((x >> 1) | x) & 0x3333333333333333ULL;
> +    x = ((x >> 2) | x) & 0x0F0F0F0F0F0F0F0FULL;
> +    x = ((x >> 4) | x) & 0x00FF00FF00FF00FFULL;
> +    x = ((x >> 8) | x) & 0x0000FFFF0000FFFFULL;
> +    x = ((x >> 16) | x) & 0x00000000FFFFFFFFULL;
> +    return x;
> +}
> +
>  #endif
> diff --git a/tests/test-bitops.c b/tests/test-bitops.c
> index 5050950..353fc98 100644
> --- a/tests/test-bitops.c
> +++ b/tests/test-bitops.c
> @@ -66,10 +66,78 @@ static void test_sextract64(void)
>      }
>  }
>  
> +typedef struct {
> +    uint32_t unshuffled;
> +    uint32_t shuffled;
> +} Shuffle32Test;
> +
> +typedef struct {
> +    uint64_t unshuffled;
> +    uint64_t shuffled;
> +} Shuffle64Test;blank line
> +
> +static const Shuffle32Test test_shuffle32_data[] = {
> +    { 0x0000FFFF, 0x55555555 },
> +    { 0x000081C5, 0x40015011 },
> +};
> +
> +static const Shuffle64Test test_shuffle64_data[] = {
> +    { 0x00000000FFFFFFFFULL, 0x5555555555555555ULL },
> +    { 0x00000000493AB02CULL, 0x1041054445000450ULL },
> +};
> +
> +static void test_half_shuffle32(void)
> +{
> +    int i;
Miss blank line here and below.
Otherwise,
Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

> +    for (i = 0; i < ARRAY_SIZE(test_shuffle32_data); i++) {
> +        const Shuffle32Test *test = &test_shuffle32_data[i];
> +        uint32_t r = half_shuffle32(test->unshuffled);
> +
> +        g_assert_cmpint(r, ==, test->shuffled);
> +    }
> +}
> +
> +static void test_half_shuffle64(void)
> +{
> +    int i;
> +    for (i = 0; i < ARRAY_SIZE(test_shuffle64_data); i++) {
> +        const Shuffle64Test *test = &test_shuffle64_data[i];
> +        uint64_t r = half_shuffle64(test->unshuffled);
> +
> +        g_assert_cmpint(r, ==, test->shuffled);
> +    }
> +}
> +
> +static void test_half_unshuffle32(void)
> +{
> +    int i;
> +    for (i = 0; i < ARRAY_SIZE(test_shuffle32_data); i++) {
> +        const Shuffle32Test *test = &test_shuffle32_data[i];
> +        uint32_t r = half_unshuffle32(test->shuffled);
> +
> +        g_assert_cmpint(r, ==, test->unshuffled);
> +    }
> +}
> +
> +static void test_half_unshuffle64(void)
> +{
> +    int i;
> +    for (i = 0; i < ARRAY_SIZE(test_shuffle64_data); i++) {
> +        const Shuffle64Test *test = &test_shuffle64_data[i];
> +        uint64_t r = half_unshuffle64(test->shuffled);
> +
> +        g_assert_cmpint(r, ==, test->unshuffled);
> +    }
> +}
> +
>  int main(int argc, char **argv)
>  {
>      g_test_init(&argc, &argv, NULL);
>      g_test_add_func("/bitops/sextract32", test_sextract32);
>      g_test_add_func("/bitops/sextract64", test_sextract64);
> +    g_test_add_func("/bitops/half_shuffle32", test_half_shuffle32);
> +    g_test_add_func("/bitops/half_shuffle64", test_half_shuffle64);
> +    g_test_add_func("/bitops/half_unshuffle32", test_half_unshuffle32);
> +    g_test_add_func("/bitops/half_unshuffle64", test_half_unshuffle64);
>      return g_test_run();
>  }
> 

-- 
Shannon

